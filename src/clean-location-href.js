/**
 * Works around the "`location.href` contains BA credentials" bug in Webkit.
 *
 * @see https://crbug.com/61946
 */
(function(){
  "use strict";
  var correct = location.origin + location.pathname + location.search + location.hash;
  if (location.href !== correct) {
    if (typeof(history.replaceState) === 'function') {
      // Replace location.href without a page reload.
      history.replaceState({}, document.title, correct);
    }
    else {
      // This causes a full page reload, but only for old Webkit versions
      // and pages with BA credentials in the URL.
      location.href = correct;
    }
  }
}());
