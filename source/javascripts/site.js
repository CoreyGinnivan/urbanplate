$('.navbar-toggle').modaal({
    fullscreen: true
});

var btns = document.querySelectorAll('.ingredients__copy');

for (var i = 0; i < btns.length; i++) {
    btns[i].addEventListener('mouseleave', clearTooltip);
    btns[i].addEventListener('blur', clearTooltip);
}

function clearTooltip(e) {
    e.currentTarget.setAttribute('class', 'ingredients__copy clipboard');
    e.currentTarget.removeAttribute('aria-label');
}

function showTooltip(elem, msg) {
    elem.setAttribute('class', 'ingredients__copy clipboard tooltipped tooltipped-s');
    elem.setAttribute('aria-label', msg);
}

$(document).ready(function(){
    var clipboard = new Clipboard('.clipboard');

    clipboard.on('success', function(e) {
        e.clearSelection();
        showTooltip(e.trigger, 'Copied!');
    });

    clipboard.on('error', function(e) {
        console.error('Action:', e.action);
        console.error('Trigger:', e.trigger);

        showTooltip(e.trigger, fallbackMessage(e.action));
    });
});