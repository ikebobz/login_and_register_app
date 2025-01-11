import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_register_app/screens/customappbar.dart';




class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // Controller to manage the search bar input
  final TextEditingController _searchController = TextEditingController();

  // Variable to store the search query
  String _searchQuery = '';
  List<String> _searchHistory = [];
  final FocusNode _searchFocusNode = FocusNode();
  bool _isSearchFocused = false;
  @override
  void initState() {
    super.initState();
    _searchFocusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _searchFocusNode..removeListener(_onFocusChange)
    ..dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isSearchFocused = _searchFocusNode.hasFocus;
    });
  }

  void _removeFocus() {
    // Remove focus from the TextField
    _searchFocusNode.unfocus();
  }

  // Function to handle the search action
  void _performSearch(String query) {
    setState(() {
      //_searchQuery = _searchController.text;
      _removeFocus();
      if(query.isNotEmpty)
        {
          if(_searchHistory.isNotEmpty && _searchHistory.contains(query))
            {
              _searchHistory.remove(query);
            }
          _searchHistory.insert(0, query);// insert into top of the list
        }

    });

    // Display the search query in a snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Searching for: $query'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Ikenna O.'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding:const EdgeInsets.all(16),
            child: Row(
              children:[
            Expanded(
              flex:15,
              child:TextField(
              controller: _searchController,
              focusNode: _searchFocusNode,
              decoration: InputDecoration(
                labelText: 'Search',
                hintText: 'Enter question part',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: _searchController.clear,
                ),
                labelStyle: GoogleFonts.lato(),
                hintStyle: GoogleFonts.lato(),
              ),
            ),
            ),
                //const Expanded(child:SizedBox()),
                Expanded(
                  child:IconButton(
                  icon: const Icon(Icons.search_outlined),
                  iconSize: 30,
                  onPressed: () => _performSearch(_searchController.text),
                ),
                ),
              ],
            ),
            ),
            if (_isSearchFocused && _searchHistory.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: _searchHistory.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_searchHistory[index]),
                      onTap: () {
                        _searchController.text = _searchHistory[index];
                        _performSearch(_searchHistory[index]);
                      },
                    );
                  },
                ),
              ),
            //const SizedBox(height: 20),

            // Search Button
            /*ElevatedButton(
              onPressed: _performSearch,
               style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                 textStyle: GoogleFonts.lato(fontSize: 14),// Full-width button
              ),child: const Text('Search'),
            ),

            const SizedBox(height: 20),

            // Display the search query
            Text(
              _searchQuery.isEmpty
                  ? 'Enter a search term above'
                  : 'You searched for: $_searchQuery',
              style: GoogleFonts.lato(fontSize: 16),
            ),*/
          ],
        ),
      ),
    );
  }
}