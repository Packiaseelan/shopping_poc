import 'package:flutter/material.dart';

class AddToCartButtonWidget extends StatelessWidget {
  final int value;
  final Function onAdd;
  final Function onRemove;

  const AddToCartButtonWidget({
    Key? key,
    required this.value,
    required this.onAdd,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: value == 0 ? _buildButton() : _buildStepper(),
    );
  }

  Widget _buildButton() {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.blue),
      child: InkWell(
        onTap: () => onAdd(),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Text('Add'),
        ),
      ),
    );
  }

  Widget _buildStepper() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(onTap: () => onRemove(), child: const Icon(Icons.remove, color: Colors.white)),
        Text('$value'),
        InkWell(onTap: () => onAdd(), child: const Icon(Icons.add, color: Colors.white)),
      ],
    );
  }
}
