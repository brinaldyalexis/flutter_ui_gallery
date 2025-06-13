import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_gallery/models/models.dart';
import 'package:go_router/go_router.dart';

class SearchJobView extends StatefulWidget {
  const SearchJobView({super.key});

  @override
  State<SearchJobView> createState() => _SearchJobViewState();
}

class _SearchJobViewState extends State<SearchJobView> {
  final TextEditingController _searchController = TextEditingController();
  List<Job> filteredJobs = [];

  @override
  void initState() {
    super.initState();
    filteredJobs = jobs; // Initialize with all jobs
  }

  void _filterJobs(String query) {
    if (query.isEmpty) {
      filteredJobs = jobs;
    } else {
      filteredJobs = jobs.where((job) {
        return job.title.toLowerCase().contains(query.toLowerCase()) ||
               job.company.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(),
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        actions: [
          IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(Icons.notifications_outlined, size: 28),
            onPressed: () {
              // Handle notifications
            },
          ),
          SizedBox(width: 12),
        ],
        title: SizedBox(
          height: 45,
          child: TextField(
            controller: _searchController,
            cursorColor: Color(0xFF0E7869),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              fillColor: Colors.grey.shade200,
              filled: true,
              suffixIcon: Icon(Icons.search, size: 22),
              hintText: 'Search for jobs',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
            onSubmitted: (value) {
              _filterJobs(value);
            },
            onChanged: (value) {
              _filterJobs(value);
            },
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: filteredJobs.length,
        itemBuilder: (context, index) {
          final job = filteredJobs[index];
          return FadeInUp(
            duration: Duration(milliseconds: 500),
            delay: Duration(milliseconds: index * 50),
            from: 20,
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    context.push('/jobs/job', extra: job);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 54,
                          height: 54,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: job.imagePath != null
                              ? Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Hero(
                                    tag: job.id,
                                    child: Image.asset(
                                      job.imagePath!,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                )
                              : Icon(Icons.work_outline, size: 32, color: Colors.grey[400]),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                job.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                job.company,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey[800],
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Flexible(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFE8F5F2),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(Icons.schedule, size: 15, color: Color(0xFF0E7869)),
                                          SizedBox(width: 4),
                                          Flexible(
                                            child: Text(
                                              job.schedule,
                                              style: TextStyle(fontSize: 13, color: Color(0xFF0E7869)),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Flexible(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF5F5F5),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(Icons.location_on, size: 15, color: Colors.grey[600]),
                                          SizedBox(width: 4),
                                          Flexible(
                                            child: Text(
                                              job.location,
                                              style: TextStyle(fontSize: 13, color: Colors.grey[700]),
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
                Positioned(
                  top: 10,
                  right: 10,
                  child: IconButton(
                      icon: Icon(
                        job.isFavorite ? Icons.bookmark : Icons.bookmark_border,
                        color: job.isFavorite ? Color(0xFF0E7869) : Colors.grey[400],
                        size: 28,
                      ),
                      onPressed: () {
                        setState(() {
                          job.isFavorite = !job.isFavorite;
                        });
                      },
                      splashRadius: 22,
                    ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}




