!function(i,t){"object"==typeof exports&&"undefined"!=typeof module?t(exports):"function"==typeof define&&define.amd?define(["exports"],t):t(i.newswireFrames={})}(this,function(i){var t=["allowfullscreen"];function n(i,n){for(var e={},o=i.attributes,r=o.length,s=n.length,a=0;a<r;a++){var f=o[a].name;if(f.substr(0,s)===n){var h=f.slice(s),u=o[a].value;t.indexOf(h)>-1&&(u=!0),e[h]=u}}return e}function e(i,t){for(var n in t)i[n]=t[n];return i}var o="embed-size",r="amp",s=function(i){var t=i.allowfullscreen;void 0===t&&(t=!1);var n=i.name,e=i.referrerpolicy,o=i.sandbox;void 0===o&&(o="allow-scripts");var r=i.src,s=i.title;this.container=i.container,this.src=r,this.allowfullscreen=t,this.name=n,this.referrerpolicy=e,this.sandbox=o,this.title=s,this.i=this.i.bind(this),window.addEventListener("message",this.i,!1),this.t()};function a(i){var t;void 0===i&&(i=document.documentElement.offsetHeight),void 0===(t={height:i})&&(t={}),window.parent.postMessage(e({sentinel:r,type:o},t),"*")}function f(){window.addEventListener("load",function i(){a(),window.removeEventListener("load",i)})}function h(){window.addEventListener("resize",function(){return a()})}function u(i){void 0===i&&(i=300),setInterval(a,i)}function d(){a(),f(),h()}s.prototype.remove=function(){window.removeEventListener("message",this.i,!1),this.container.removeChild(this.iframe),this.iframe=null},s.prototype.t=function(){var i=this.iframe=document.createElement("iframe");i.setAttribute("src",this.src),i.setAttribute("width","100%"),i.setAttribute("scrolling","no"),i.setAttribute("marginheight","0"),i.setAttribute("frameborder","0"),this.allowfullscreen&&i.setAttribute("allowfullscreen",""),this.name&&i.setAttribute("name",name),this.referrerpolicy&&i.setAttribute("referrerpolicy",this.referrerpolicy),i.setAttribute("sandbox",this.sandbox),this.title&&i.setAttribute("title",this.title),this.container.appendChild(i)},s.prototype.i=function(i){if(i.source===this.iframe.contentWindow){var t=i.data;t.sentinel===r&&t.type===o&&this.o(t.height)}},s.prototype.o=function(i){this.iframe.setAttribute("height",i)},i.autoInitFrames=function(){for(var i=document.querySelectorAll("[data-frame-src]:not([data-frame-auto-initialized])"),t=[],o=0;o<i.length;o++){var r=i[o],a=n(r,"data-frame-");r.setAttribute("data-frame-auto-initialized",""),t.push(new s(e({container:r},a)))}return t},i.Framer=s,i.initFrame=d,i.initFrameAndPoll=function(i){d(),u(i)},i.sendFrameHeight=a,i.sendHeightOnLoad=f,i.sendHeightOnPoll=u,i.sendHeightOnResize=h});
//# sourceMappingURL=index.umd.js.map
// MIT License
//
// Copyright (c) 2019 Ryan Murphy
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
