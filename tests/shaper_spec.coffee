describe "Shaper", ->

  describe "Rectangle", ->

    it "should be able to get its width and height attributes", ->
      rect = new Rectangle(100, 100)
      expect(rect.getWidth()).toEqual 100
      expect(rect.getHeight()).toEqual 100
