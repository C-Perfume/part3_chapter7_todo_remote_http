import 'package:after_layout/after_layout.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/datetime_extension.dart';
import 'package:fast_app_base/common/util/app_keyboard_util.dart';
import 'package:fast_app_base/common/widget/w_round_button.dart';
import 'package:fast_app_base/data/memory/todo_data_holder.dart';
import 'package:fast_app_base/data/simple_result.dart';
import 'package:flutter/material.dart';
import 'package:nav/dialog/dialog.dart';
import 'package:nav/enum/enum_nav_ani.dart';

import '../../../common/widget/dialog_scaffold.dart';
import '../../../data/memory/vo_todo.dart';

class WriteTodoBottomSheet extends DialogWidget<SimpleResult> {
  WriteTodoBottomSheet({
    super.context,
    super.key,
    super.barrierColor = const Color(0x80000000),
    super.animation = NavAni.Bottom,
    super.useRootNavigator = false,
  });

  @override
  State<StatefulWidget> createState() => _WriteTodoBottomSheetState();
}

class _WriteTodoBottomSheetState extends DialogState<WriteTodoBottomSheet> with AfterLayoutMixin {
  final todoTextEditingController = TextEditingController();
  final node = FocusNode();
  DateTime? _selectedDate;

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    AppKeyboardUtil.show(context, node);
  }

  @override
  Widget build(BuildContext context) {
    return DialogScaffold(
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: const EdgeInsets.only(top: 20, bottom: 20, right: 15, left: 15),
          decoration: BoxDecoration(
              color: context.backgroundColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  '할일을 작성해주세요.'.text.size(18).bold.make(),
                  emptyExpanded,
                  if (_selectedDate != null)
                    Tap(
                      onTap: onTapChangedDate,
                      child: _selectedDate!.formattedDate.text.make(),
                    ),
                  IconButton(
                    padding: const EdgeInsets.all(15),
                    onPressed: onTapChangedDate,
                    icon: const Icon(Icons.calendar_month),
                  ),
                ],
              ),
              const Height(20),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      focusNode: node,
                      controller: todoTextEditingController,
                      onEditingComplete: () => done(context),
                    ),
                  ),
                  RoundButton(
                      text: '추가',
                      onTap: () {
                        done(context);
                      })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onTapChangedDate() async {
    final selectedDate = await showDatePicker(
        context: context,
        helpText: '목표일을 선택해주세요.',
        initialDate: _selectedDate ?? DateTime.now(),
        firstDate: DateTime.now().subtract(const Duration(days: 365)),
        lastDate: DateTime.now().add(const Duration(days: 365 * 10)));
    if (selectedDate != null) {
      setState(() {
        _selectedDate = selectedDate;
      });
    }
  }

  void done(BuildContext context) {
    TodoDataHolder.of(context)
        .addTodo(Todo(title: todoTextEditingController.text)..dueDate = _selectedDate);
    widget.hide();
  }
}
