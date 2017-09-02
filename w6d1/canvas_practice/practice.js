document.addEventListener("DOMContentLoaded", function(){
  var canvas = document.getElementById('mycanvas');
  var ctx = canvas.getContext('2d');
  //
  // ctx.fillStyle = "blue";
  // ctx.fillRect(75,75, 10,20);
  //
  // ctx.beginPath();
  // ctx.arc(250,250,69,0, 2 * Math.PI);
  ctx.strokeStyle = 'purple';
  // ctx.stroke();
  // ctx.fill();

  ctx.beginPath();
  ctx.moveTo(400,400);
  ctx.lineTo(450,400);
  ctx.moveTo(425,400);
  ctx.lineTo(425,350);
  ctx.moveTo(425,375);
  ctx.lineTo(440,375);
  ctx.closePath();
  ctx.stroke();

  // // Stroked triangle
  // ctx.beginPath();
  // ctx.moveTo(125, 125);
  // ctx.lineTo(125, 45);
  // ctx.lineTo(45, 125);
  // ctx.closePath();
  // ctx.stroke();
});
