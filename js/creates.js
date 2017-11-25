const SVG_URL = "http://www.w3.org/2000/svg";

// SVG
function createSVG(id = ''){
    var svg = document.createElementNS(SVG_URL,'svg')
    svg.id = id
    return svg
}

function createPath(d = '', id = '', className = '' ,strokeColor = '#000', strokeWidth = '1px') {
    var path = document.createElementNS(SVG_URL,'path')
    path.setAttribute('d',d)
    path.id = id
    path.style.stroke = strokeColor
    path.style.strokeWidth = strokeWidth
    return path
}

function createRect(width = '', height = '',id = '', className = '' , fillColor = '#000',strokeWidth = '1',stroke = '#FFF') {
    var rect = document.createElementNS(SVG_URL,'rect')
    rect.id = id
    rect.className = className
    rect.width = width
    rect.height = height
    rect.style.fill = fillColor
    rect.style.strokeWidth = strokeWidth
    rect.style.stroke = stroke
    return rect
}