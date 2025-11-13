from krita import *

# Crear un nuevo documento
doc = Krita.instance().createDocument(800, 800, "Personaje Geométrico", "RGBA", "U8", 300.0)
Krita.instance().activeDocument().setDocument(doc)

# Obtener la capa activa
layer = doc.createNode("Fondo", "paintLayer")
doc.rootNode().addChildNode(layer, None)

# Crear una función para dibujar círculos
def draw_circle(x, y, radius, color):
    # Crear un nodo de pintura
    paint_node = layer.createNode("Circulo", "paintLayer")
    layer.addChildNode(paint_node, None)

    # Crear una forma (círculo) usando el pincel
    paint_node.setPos(x - radius, y - radius)
    paint_node.setSize(radius * 2, radius * 2)
    paint_node.setBrushPreset("basic-circle")  # Usa el pincel predeterminado de círculo
    paint_node.setColor(color)
    return paint_node

# Crear una función para dibujar un cuadrado
def draw_square(x, y, size, color):
    # Crear un nodo de pintura para el cuadrado
    paint_node = layer.createNode("Cuadrado", "paintLayer")
    layer.addChildNode(paint_node, None)

    # Crear un cuadrado usando el pincel
    paint_node.setPos(x - size / 2, y - size / 2)
    paint_node.setSize(size, size)
    paint_node.setBrushPreset("basic-square")  # Usa un pincel cuadrado
    paint_node.setColor(color)
    return paint_node

# Crear una función para dibujar un triángulo
def draw_triangle(x, y, size, color):
    # Crear un nodo de pintura para el triángulo
    paint_node = layer.createNode("Triángulo", "paintLayer")
    layer.addChildNode(paint_node, None)

    # Configura el triángulo en las coordenadas
    paint_node.setPos(x, y)
    paint_node.setSize(size, size)
    paint_node.setBrushPreset("basic-triangle")  # Usa un pincel triangular
    paint_node.setColor(color)
    return paint_node

# Dibujar la cabeza (círculo)
head = draw_circle(400, 200, 80, QColor(255, 204, 0))  # Amarillo

# Dibujar el cuerpo (cuadrado)
body = draw_square(400, 320, 120, QColor(0, 128, 255))  # Azul

# Dibujar los brazos (triángulos)
left_arm = draw_triangle(250, 350, 50, QColor(0, 255, 0))  # Verde
right_arm = draw_triangle(550, 350, 50, QColor(0, 255, 0))  # Verde

# Dibujar las piernas (triángulos)
left_leg = draw_triangle(320, 460, 60, QColor(255, 0, 0))  # Rojo
right_leg = draw_triangle(460, 460, 60, QColor(255, 0, 0))  # Rojo

# Dibujar los ojos (círculos)
left_eye = draw_circle(370, 220, 15, QColor(0, 0, 0))  # Negro
right_eye = draw_circle(430, 220, 15, QColor(0, 0, 0))  # Negro

# Dibujar la boca (usando una línea simple)
paint_node = layer.createNode("Boca", "paintLayer")
layer.addChildNode(paint_node, None)
paint_node.setPos(380, 180)
paint_node.setSize(40, 5)
paint_node.setBrushPreset("basic-line")  # Usa el pincel predeterminado de línea
paint_node.setColor(QColor(0, 0, 0))  # Color negro

# Guardar el archivo
doc.saveAs("/path/to/your/personaje_geometrico.kra")  # Cambia esta ruta al lugar donde desees guardarlo

# Cerrar el documento (opcional)
Krita.instance().activeDocument().close()
