describe "Shaper", ->

  describe "Rectangle", ->

    it "should be able to get its width and height attributes", ->
      rect = new Rectangle(100, 100)
      expect(rect.getWidth()).toEqual 100
      expect(rect.getHeight()).toEqual 100

    describe "drawing", ->

      it "should be able to draw a box", ->
        rect = new Rectangle(7, 8)
        box = ""
        box += "-------\n"
        box += "|.....|\n"
        box += "|.....|\n"
        box += "|.....|\n"
        box += "|.....|\n"
        box += "|.....|\n"
        box += "|.....|\n"
        box += "-------\n"

        rectMatrix = rect.draw()
        expect((new Matrix).getStringForMatrix(rectMatrix)).toEqual box

  describe "Canvas", ->

    it "should be able to get its width and height attributes", ->
      canvas = new Canvas(100, 100)
      expect(canvas.getWidth()).toEqual 100
      expect(canvas.getHeight()).toEqual 100

    it "should be able to place a sprite with a rectangle on a canvas", ->
      rect = new Rectangle(4, 4)
      sprite = new Sprite(1, 1, rect)
      canvas = new Canvas(6, 6)
      canvas.addSprites([sprite])

      a =  ""
      a += "......\n"
      a += ".----.\n"
      a += ".|..|.\n"
      a += ".|..|.\n"
      a += ".----.\n"
      a += "......\n"

      canvasMatrix = canvas.draw()
      expect((new Matrix).getStringForMatrix(canvasMatrix)).toEqual a

    it "should be able to place two sprites with two rectangle on a canvas", ->
      rect1 = new Rectangle(4, 4)
      rect2 = new Rectangle(3, 5)
      sprite1 = new Sprite(1, 1, rect1)
      sprite2 = new Sprite(3, 3, rect2)
      canvas = new Canvas(8, 8)
      canvas.addSprites([sprite1, sprite2])

      a =  ""
      a += "........\n"
      a += ".----...\n"
      a += ".|..|...\n"
      a += ".|.---..\n"
      a += ".--|.|..\n"
      a += "...|.|..\n"
      a += "...|.|..\n"
      a += "...---..\n"

      canvasMatrix = canvas.draw()
      expect((new Matrix).getStringForMatrix(canvasMatrix)).toEqual a

    describe "exceeding the constraints of the canvas", ->

      it "should truncate too tall sprites", ->
        rect = new Rectangle(4, 6)
        sprite = new Sprite(1, 1, rect)
        canvas = new Canvas(6, 6)
        canvas.addSprites([sprite])

        a =  ""
        a += "......\n"
        a += ".----.\n"
        a += ".|..|.\n"
        a += ".|..|.\n"
        a += ".|..|.\n"
        a += ".|..|.\n"

        canvasMatrix = canvas.draw()
        expect((new Matrix).getStringForMatrix(canvasMatrix)).toEqual a

      it "should truncate too wide sprites", ->
        rect = new Rectangle(6, 4)
        sprite = new Sprite(1, 1, rect)
        canvas = new Canvas(6, 6)
        canvas.addSprites([sprite])

        a =  ""
        a += "......\n"
        a += ".-----\n"
        a += ".|....\n"
        a += ".|....\n"
        a += ".-----\n"
        a += "......\n"

        canvasMatrix = canvas.draw()
        expect((new Matrix).getStringForMatrix(canvasMatrix)).toEqual a
