class Matrix

  getStringForMatrix: (matrix) ->
    result = ""
    _.each matrix, (row) ->
      result += row.join("").replace(/\ /g, ".") + "\n"
    result
  
class Rectangle

  constructor: (width, height) ->
    @_width = width
    @_height = height

  getHeight: -> @_height
  getWidth: -> @_width

  draw: ->
    @_matrix = []
    @_matrix.push @_topBottomRow()
    for num in [0..@_height - 3]
      @_matrix.push @_verticalRow()
    @_matrix.push @_topBottomRow()
    @_matrix

  getValueAtXY: (x, y) ->
    @draw()
    @_matrix[y][x]

  _topBottomRow: ->
    results = []
    for num in [0..@_width - 1]
      results.push "-"
    results

  _verticalRow: ->
    results = []
    results.push "|"
    internalSpacerWidth = @_width - 3
    for num in [0..internalSpacerWidth]
      results.push " "
    results.push "|"
    results

class Sprite

  constructor: (x, y, member) ->
    @_x = x
    @_y = y
    @_member = member

  getX: -> @_x
  getY: -> @_y

  getWidth: -> @_member.getWidth()
  getHeight: -> @_member.getHeight()

  getValueAtXY: (x, y) ->
    memberX = x - @_x
    memberY = y - @_y
    @_member.getValueAtXY(memberX, memberY)

class Canvas

  constructor: (width, height) ->
    @_width = width
    @_height = height
    @_sprites = null
    @_matrix = []
    @_initializeMatrix()

  getHeight: -> @_height
  getWidth: -> @_width

  addSprites: (sprites) ->
    @_sprites = sprites

  draw: ->
    @_initializeMatrix()
    _.each @_sprites, (sprite) =>
      @_addSpriteData(sprite)
    @_matrix

  _addSpriteData: (sprite) ->
    startX = sprite.getX()
    startY = sprite.getY()
    endX = sprite.getX() + (sprite.getWidth() - 1)
    endY = sprite.getY() + (sprite.getHeight() - 1)
    endX = Math.min(endX, @getWidth() - 1)
    endY = Math.min(endY, @getHeight() - 1)
    for y in [startY..endY]
      for x in [startX..endX]
        value = sprite.getValueAtXY(x,y)
        @_matrix[y][x] = value

  _initializeMatrix: ->
    @_matrix = []
    for y in [0..@_height - 1]
      row = []
      for x in [0..@_width - 1]
        row.push(" ")
      @_matrix.push(row)

