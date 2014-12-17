# `location.href` Cleaner

`location.href` Cleaner removes HTTP Basic Authentication credentials from `location.href` to work around [a Webkit bug|https://crbug.com/61946].

If HTTP Basic Authentication (BA) credentials are included in the URL, Webkit stores them in `window.location.href`.  If `location.href` includes the BA credentials, this script removes them with `history.replaceState()` or a page reload if the History API is not supported.  If there are no BA credenitals in `location.href`, this script will do nothing.

Include this script in the `<head>`, before everything else.  It is best run as an inline script so as not to block the rest of the page loading.  E.g.:

```html
<html>
  <head>
    <script type="text/javascript">
        {{PLACEHOLDER}}
    </script>
```
