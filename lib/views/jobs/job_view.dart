import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_gallery/models/models.dart';
import 'package:intl/intl.dart';

class JobView extends StatefulWidget {
  const JobView({super.key, this.job});
  final Job? job;

  @override
  State<JobView> createState() => _JobViewState();
}

class _JobViewState extends State<JobView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          widget.job?.company ?? 'Company',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        scrolledUnderElevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.share, color: Colors.black),
            onPressed: () {
              // Handle share action
            },
          ),
          IconButton(
            icon: Icon(
              widget.job!.isFavorite ? Icons.bookmark : Icons.bookmark_border,
              color:
                  widget.job!.isFavorite ? Color(0xFF0E7869) : Colors.grey[400],
              size: 28,
            ),
            onPressed: () {
              setState(() {
                widget.job!.isFavorite = !widget.job!.isFavorite;
              });
            },
            splashRadius: 22,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          FadeInUp(
            duration: Duration(milliseconds: 500),
            from: 20,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 4),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withAlpha(8),
                    blurRadius: 16,
                    offset: Offset(0, 6),
                  ),
                ],
                border: Border.all(color: Colors.grey.shade200, width: 1.0),
              ),
              child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: widget.job!.imagePath != null
                        ? Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Hero(
                            tag: widget.job!.id,
                            child: Image.asset(
                              widget.job!.imagePath!,
                              fit: BoxFit.contain,
                            ),
                          ),
                        )
                        : Icon(
                          Icons.work_outline,
                          size: 32,
                          color: Colors.grey[400],
                        ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.job!.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          widget.job!.company,
                          style: TextStyle(fontSize: 14, color: Color(0xFF0E7869)),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Flexible(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFE8F5F2),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.schedule,
                                      size: 15,
                                      color: Color(0xFF0E7869),
                                    ),
                                    SizedBox(width: 4),
                                    Flexible(
                                      child: Text(
                                        widget.job!.schedule,
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xFF0E7869),
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Flexible(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFF5F5F5),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      size: 15,
                                      color: Colors.grey[600],
                                    ),
                                    SizedBox(width: 4),
                                    Flexible(
                                      child: Text(
                                        widget.job!.location,
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey[700],
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          FadeInUp(
            duration: Duration(milliseconds: 500),
            delay: Duration(milliseconds: 100),
            from: 20,
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withAlpha(8),
                    blurRadius: 16,
                    offset: Offset(0, 6),
                  ),
                ],
                border: Border.all(color: Colors.grey.shade200, width: 1.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.job!.description!,
                    style: const TextStyle(fontSize: 14, height: 1.5),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          widget.job!.requirements != null && widget.job!.requirements!.isNotEmpty
              ? FadeInUp(
                  duration: Duration(milliseconds: 500),
                  delay: Duration(milliseconds: 200),
                  from: 20,
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withAlpha(8),
                          blurRadius: 16,
                          offset: Offset(0, 6),
                        ),
                      ],
                      border: Border.all(color: Colors.grey.shade200, width: 1.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Requirements',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        ...widget.job!.requirements!.map(
                          (req) => Padding(
                            padding: EdgeInsets.symmetric(vertical: 2),
                            child: Text('• $req', style: const TextStyle(fontSize: 14)),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : SizedBox.shrink(),
          widget.job!.requirements != null && widget.job!.requirements!.isNotEmpty
              ? const SizedBox(height: 16)
              : SizedBox.shrink(),
          widget.job!.skills != null && widget.job!.skills!.isNotEmpty
              ? FadeInUp(
                  duration: Duration(milliseconds: 500),
                  delay: Duration(milliseconds: 300),
                  from: 20,
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withAlpha(8),
                          blurRadius: 16,
                          offset: Offset(0, 6),
                        ),
                      ],
                      border: Border.all(color: Colors.grey.shade200, width: 1.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Skills',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: widget.job!.skills!
                              .map(
                                (skill) => Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF5F5F5),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.tag,
                                        size: 15,
                                        color: Colors.grey[600],
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        skill,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                )
              : SizedBox.shrink(),
          widget.job!.skills != null && widget.job!.skills!.isNotEmpty
              ? const SizedBox(height: 16)
              : SizedBox.shrink(),
          widget.job!.salary != null
              ? FadeInUp(
                  duration: Duration(milliseconds: 500),
                  delay: Duration(milliseconds: 400),
                  from: 20,
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withAlpha(8),
                          blurRadius: 16,
                          offset: Offset(0, 6),
                        ),
                      ],
                      border: Border.all(color: Colors.grey.shade200, width: 1.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Salary',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          formatCurrency(widget.job!.salary!),
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                )
              : SizedBox.shrink(),
          widget.job!.salary != null ? const SizedBox(height: 16) : SizedBox.shrink(),
          widget.job!.benefits != null && widget.job!.benefits!.isNotEmpty
              ? FadeInUp(
                  duration: Duration(milliseconds: 500),
                  delay: Duration(milliseconds: 500),
                  from: 20,
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withAlpha(8),
                          blurRadius: 16,
                          offset: Offset(0, 6),
                        ),
                      ],
                      border: Border.all(color: Colors.grey.shade200, width: 1.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Benefits',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        ...widget.job!.benefits!.map(
                          (benefit) => Padding(
                            padding: EdgeInsets.symmetric(vertical: 2),
                            child: Text(
                              '• $benefit',
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : SizedBox.shrink(),
          const SizedBox(height: 16),
          FadeInUp(
            duration: Duration(milliseconds: 500),
            delay: Duration(milliseconds: 600),
            from: 20,
            child: ElevatedButton(
              onPressed: () {
                // Handle apply action
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: Color(0xFF0E7869),
              ),
              child: const Text(
                'Apply Now',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  //this method for currency formatting of the salary and commas
  String formatCurrency(double amount) {
    final formatter = NumberFormat.currency(locale: 'en_US', symbol: '\$');
    return formatter.format(amount);
  }
}
