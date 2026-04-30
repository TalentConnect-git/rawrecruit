import 'package:flutter/material.dart';
import 'package:rawrecruit/src/common/index.dart';

class CommonAutocomplete extends StatelessWidget {
  final String label;

  final String hint;

  final List<String> options;

  final String initialValue;

  final Function(String) onChanged;

  final Function(String)? onSubmitted;

  final Function(String)? onSelected;

  const CommonAutocomplete({
    super.key,
    required this.label,
    required this.hint,
    required this.options,
    required this.initialValue,
    required this.onChanged,
    this.onSubmitted,
    this.onSelected,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,

      children: [
        Autocomplete<String>(
          initialValue: TextEditingValue(
            text: initialValue,
          ),

          optionsBuilder: (
            textEditingValue,
          ) {
            if (textEditingValue
                .text
                .isEmpty) {
              return options;
            }

            return options.where(
              (option) => option
                  .toLowerCase()
                  .contains(
                    textEditingValue
                        .text
                        .toLowerCase(),
                  ),
            );
          },

          onSelected: (value) {
            onSelected?.call(
              value,
            );
          },

          fieldViewBuilder: (
            context,
            controller,
            focusNode,
            onFieldSubmitted,
          ) {
            controller.text =
                initialValue;

            return TextField(
              controller:
                  controller,

              focusNode:
                  focusNode,

              style:
                  AppTextStyles
                      .s16W400
                      .copyWith(
                        color:
                            AppColors
                                .white,
                      ),

              decoration:
                  InputDecoration(
                    labelText:
                        hint,

                    labelStyle:
                        AppTextStyles
                            .s16W500
                            .copyWith(
                              color:
                                  AppColors
                                      .white,
                            ),

                    floatingLabelStyle:
                        AppTextStyles
                            .s16W400
                            .copyWith(
                              color:
                                  AppColors
                                      .white,
                            ),

                    isDense:
                        true,

                    border:
                        OutlineInputBorder(
                          borderSide:
                              BorderSide(
                                color:
                                    AppColors
                                        .border,
                              ),

                          borderRadius:
                              BorderRadius.circular(
                                8,
                              ),
                        ),

                    focusedBorder:
                        OutlineInputBorder(
                          borderSide:
                              BorderSide(
                                color:
                                    AppColors
                                        .kGreen,
                              ),

                          borderRadius:
                              BorderRadius.circular(
                                8,
                              ),
                        ),

                    enabledBorder:
                        OutlineInputBorder(
                          borderSide:
                              BorderSide(
                                color:
                                    AppColors
                                        .white,
                              ),

                          borderRadius:
                              BorderRadius.circular(
                                8,
                              ),
                        ),

                    errorBorder:
                        OutlineInputBorder(
                          borderSide:
                              BorderSide(
                                color:
                                    AppColors
                                        .errorBorder,
                              ),

                          borderRadius:
                              BorderRadius.circular(
                                8,
                              ),
                        ),

                    focusedErrorBorder:
                        OutlineInputBorder(
                          borderSide:
                              BorderSide(
                                color:
                                    AppColors
                                        .kGreen,
                              ),

                          borderRadius:
                              BorderRadius.circular(
                                8,
                              ),
                        ),
                  ),

              onChanged:
                  onChanged,

              onSubmitted:
                  onSubmitted,
            );
          },

          optionsViewBuilder: (
            context,
            onSelected,
            options,
          ) {
            return Align(
              alignment:
                  Alignment.topLeft,

              child: Material(
                elevation: 8,

                borderRadius:
                    BorderRadius.circular(
                      12,
                    ),

                child:
                    Container(
                      width:
                          MediaQuery.of(
                                context,
                              )
                              .size
                              .width -
                          32,

                      constraints:
                          const BoxConstraints(
                            maxHeight:
                                220,
                          ),

                      decoration:
                          BoxDecoration(
                            color:
                                const Color(
                                  0xFF1F2937,
                                ),

                            borderRadius:
                                BorderRadius.circular(
                                  12,
                                ),

                            border:
                                Border.all(
                                  color:
                                      AppColors
                                          .border,
                                ),
                          ),

                      child:
                          ListView.separated(
                            shrinkWrap:
                                true,

                            padding:
                                EdgeInsets.zero,

                            itemCount:
                                options
                                    .length,

                            separatorBuilder:
                                (
                                  _,
                                  __,
                                ) => Divider(
                                  height:
                                      1,

                                  color:
                                      Colors
                                          .grey
                                          .shade800,
                                ),

                            itemBuilder:
                                (
                                  context,
                                  index,
                                ) {
                                  final option =
                                      options
                                          .elementAt(
                                            index,
                                          );

                                  return ListTile(
                                    dense:
                                        true,

                                    title:
                                        Text(
                                          option,

                                          style:
                                              TextStyle(
                                                color:
                                                    Colors
                                                        .grey
                                                        .shade300,
                                              ),
                                        ),

                                    onTap: () {
                                      onSelected(
                                        option,
                                      );
                                    },
                                  );
                                },
                          ),
                    ),
              ),
            );
          },
        ),
      ],
    );
  }
}