//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/


//converts the currency using the custom gem
function convert()
{

  date = document.getElementById("dropdownMenu1").firstChild.data
  fromC = document.getElementById("fromButton").firstChild.data
  toC = document.getElementById("toButton").firstChild.data

    var params = { 'date': date, 'fromC': fromC , 'toC': toC};

    $.ajax({
        type: "POST",
        url: '/home/upd',
        data: params,
        dataType: "JSON",
        success: function(data) {

          money = document.getElementById('input_money').value
          fromC = document.getElementById("fromButton").firstChild.data
          toC = document.getElementById("toButton").firstChild.data
          new_money = money * data.rate

          if (money != "")
          {
              el = document.getElementById("results");
              el.firstChild.data = money+" "+fromC+" = "+new_money.toFixed(2)+" "+toC;
          }
        }
    });



}

function updateDateButton(input)
{
var el = document.getElementById("dropdownMenu1");
    el.firstChild.data = input
}

function updateFromButton(input)
{
var el = document.getElementById("fromButton");
    el.firstChild.data = input


}

function updateToButton(input)
{
var el = document.getElementById("toButton");
    el.firstChild.data = input


}
