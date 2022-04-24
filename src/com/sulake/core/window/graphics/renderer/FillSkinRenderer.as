// by nota

//com.sulake.core.window.graphics.renderer.FillSkinRenderer

package com.sulake.core.window.graphics.renderer
{
    import com.sulake.core.window._SafeStr_3109;
    import flash.display.BitmapData;
    import flash.geom.Rectangle;

    public class FillSkinRenderer extends SkinRenderer 
    {

        public function FillSkinRenderer(_arg_1:String)
        {
            super(_arg_1);
        }

        override public function draw(_arg_1:_SafeStr_3109, _arg_2:BitmapData, _arg_3:Rectangle, _arg_4:uint, _arg_5:Boolean):void
        {
            _arg_2.fillRect(_arg_3, _arg_1.color);
        }


    }
}//package com.sulake.core.window.graphics.renderer

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)


