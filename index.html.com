
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Maths Genius AI</title>
<style>
body {
  font-family: Arial;
  background: #eef2ff;
  text-align: center;
  padding: 20px;
}
.container {
  background: white;
  max-width: 500px;
  margin: auto;
  padding: 20px;
  border-radius: 15px;
  box-shadow: 0 3px 15px #bbb;
}
input {
  width: 90%;
  padding: 13px;
  font-size: 17px;
  margin: 10px;
}
button {
  background: #4f46e5;
  color: white;
  padding: 13px 25px;
  border: none;
  border-radius: 8px;
  font-size: 17px;
}
#answer {
  margin-top: 20px;
  white-space: pre-wrap;
  text-align: left;
}
</style>
</head>
<body>
<div class="container">
<h1>🤖 Maths Genius AI</h1>
<p>Your Free Maths Solver</p>
<input id="question" placeholder="Enter a maths question">
<br>
<button onclick="solve()">Solve Maths</button>
<div id="answer"></div>
</div>

<script>
function solve() {
  let q = document.getElementById("question").value.trim();
  let output = document.getElementById("answer");

  if (!q) {
    output.innerText = "Please enter a question.";
    return;
  }

  if (!/^[0-9+\-*/().\s]+$/.test(q)) {
    output.innerText = "Only maths expressions are allowed.";
    return;
  }

  try {
    let result = Function('"use strict"; return (' + q + ')')();
    if (!Number.isFinite(result)) throw Error();
    output.innerText =
      "Step 1: Your question is " + q +
      "\nStep 2: Calculate using BODMAS." +
      "\nStep 3: Final Answer = " + result;
  } catch (e) {
    output.innerText = "Please enter a valid maths expression.";
  }
}
</script>
</body>
</html>

