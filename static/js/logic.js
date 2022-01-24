const url = "/data";
d3.json(url).then(function(response) {  
    console.log("data1:",response);
});

var predictButton = d3.select("#predict");



predictButton.on("click",function() {
    // Prevent the page from refreshing
    d3.event.preventDefault();
    console.log("Predict button clicked");
    
    const url = "/data";
        
    d3.json(url).then(function(response) {  

        console.log("data2:",response);

        var tableData = response;

        // let dataList = [];
        // for (let i=0; i<tableData.length; i++){
        //     var dict = {};
        //     for (let j=0; j<gameid.length; j++){
        //         dict[tableData[i]] = tableData[i][j];
        //     };
        //     dataList.push(dict);
        // }     

        // Clear the table before populating with new data
        var table1 = document.getElementById("scores-body"); 
        table1.innerHTML ='';

        // Select the input element and get the raw HTML node
        var inputElement_year = d3.select("#years");
        var inputElement_round = d3.select("#rounds");
        var inputElement_team = d3.select("#team");
        
        // Get the value property of each of the input elements
        var inputValue_year = inputElement_year.property("value");
        var inputValue_round = inputElement_round.property("value");
        var inputValue_team = inputElement_team.property("value");
        
        // Display the value property of each of the input elements
        console.log("year:",inputValue_year);
        console.log("city:",inputValue_round);
        console.log("Team:",inputValue_team);
        
        var filteredData = tableData.filter((games) => {

            // By default set the match to false
            var matchesYear = false;
            var matchesRound = false;
            var matchesTeam = false;

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
            if (inputValue_team != '' && (games.team == inputValue_team || games.team2 == inputValue_team)) {
                matchesTeam = true;
            }
            // If the user didn't enter anything in the team 1 field, set match to true by default
            if (inputValue_team == '') {
                matchesTeam = true;
            };
            
            
            // Will return true if all fields match
            return matchesYear && matchesRound && matchesTeam;

        });

    //  Refresh the HTML table with the filtered data
        
        console.log("All Filtered data: ", filteredData);

        //  Refresh the HTML table with the filtered data


        // Clear the previous data
        // var table1 = document.getElementById("scores-body"); 
        // table1.innerHTML="";

        var tbody =d3.select("tbody");
        filteredData.forEach(function(game) {
            console.log(game);
            var row = tbody.append("tr");
            var yCell = row.append("td");
            yCell.text(game['year']);
            var rCell = row.append("td");
            rCell.text(game['round']);
            var t1Cell = row.append("td");
            t1Cell.text(game['team']);
            var t1pCell = row.append("td");
            t1pCell.text(Math.round(game['model_prob_1']*100)/100);
            var t2Cell = row.append("td");
            t2Cell.text(game['team2']);
            var t2pCell = row.append("td");
            t2pCell.text(Math.round(game['model_prob_2']*100)/100);
            var pwCell = row.append("td");
            // pwCell.className += " mw"
            // console.log(pwCell);
            // document.getElementsByClassName("mw").style.color = "red";
            pwCell.text(game['Model_winning_team']);
            var awCell = row.append("td");
            awCell.text(game['Actual_winning_team']);
            
            // Object.entries(game).forEach(function([key,value]){
            //     console.log(key,value);
            //     var cell = tbody.append("td");
            //     cell.text(value);
            // });
        });
       
    });
});

var resetButton = d3.select("#reset");

resetButton.on("click",function() {
    console.log("reset button clicked");
    // Clear the previous data
    var table1 = document.getElementById("scores-body"); 
    table1.innerHTML="";
});