var predictButton = d3.select("#predict");
const url = "/data";
console.log("Into Logic.js.....");

predictButton.on("click",function() {
    console.log("Predict.. button clicked");
    const url = "/data";    
    d3.json(url).then(function(response) {  
        console.log("data:",response);
        var tableData = response;
        let dataList = [];
        for (let i=0; i<tableData.length; i++){
            var dict = {};
            for (let j=0; j<gameid.length; j++){
                dict[tableData[i]] = tableData[i][j];
            };
            dataList.push(dict);
        }

        // Prevent the page from refreshing
        //d3.event.preventDefault();

        // Clear the table
        var table1 = document.getElementById("scores-body"); 
        //table1.innerHTML ='';  

        // Select the input element and get the raw HTML node
        var inputElement_year = d3.select("#years");
        var inputElement_round = d3.select("#rounds");
        var inputElement_team1 = d3.select("#team1");
        var inputElement_team2 = d3.select("#team2");
        
        // Get the value property of each of the input elements
        var inputValue_year = inputElement_year.property("value");
        var inputValue_round = inputElement_round.property("value");
        var inputValue_team1 = inputElement_team1.property("value");
        var inputValue_team2 = inputElement_team2.property("value");
        
        // Display the value property of each of the input elements
        console.log("year:",inputValue_year);
        console.log("round:",inputValue_round);
        console.log("team1:",inputValue_team1);
        console.log("team2:",inputValue_team2);
        

        var filteredData = dataList.filter((games) => {

            // By default set the match to false
            var matchesYear = false;
            var matchesRound = false;
            var matchesTeam1 = false;
            var matchesTeam2 = false;

            // If user has entered a value to the year field, check if it is included in the data
            if (inputValue_year != '' && games.year == inputValue_year) {
                matchesYear = true;
            }
            // If the user didn't enter anything in the year field, set match to true by default
            if (inputValue_year == '') {
                matchesYear = true;
            }
            // If user has entered a value to the rounds field, check if it is included in the data
            if (inputValue_round != '' && games.round == inputValue_round) {
                matchesRound = true;
            }
            // If the user didn't enter anything in the rounds field, set match to true by default
            if (inputValue_round == '') {
                matchesRound = true;
            }
            // If user has entered a value to the team 1 field, check if it is included in the data
            if (inputValue_team1 != '' && games.team1 == inputValue_team1) {
                matchesTeam1 = true;
            }
            // If the user didn't enter anything in the team 1 field, set match to true by default
            if (inputValue_team1 == '') {
                matchesTeam1 = true;
            }
            // If user has entered a value to the team 2 field, check if it is included in the data
            if (inputValue_team2 != '' && games.team2 == inputValue_team2) {
                matchesTeam2 = true;
            }
            // If the user didn't enter anything in the team 2 field, set match to true by default
            if (inputValue_team2 == '') {
                matchesTeam2 = true;
            }
            
            // Will return true if all fields match
            return matchesYear && matchesRound && matchesTeam1 && matchesTeam2;

        });

    //  Refresh the HTML table with the filtered data
        
        console.log("All Filtered data: ", filteredData);

        //  Refresh the HTML table with the filtered data


        // Clear the previous data
        // var table1 = document.getElementById("scores-body"); 
        // table1.innerHTML="";

        var tbody =d3.select("tbody");
        filteredData.forEach(function(games) {
            console.log(games);
            var row = tbody.append("tr");
            
            Object.entries(games).forEach(function([key,value]){
                console.log(key,value);
                var cell = tbody.append("td");
                cell.text(value);
            });
        });
       
    });
});

var resetButton = d3.select("#reset");

resetButton.on("click",function() {
    console.log("Reset button clicked");
    // Clear the previous data
    var table1 = document.getElementById("scores-body"); 
    table1.innerHTML="";
});