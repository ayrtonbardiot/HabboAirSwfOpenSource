// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.freeflowchat.viewer.simulation.BlankStyle

package com.sulake.habbo.freeflowchat.viewer.simulation
{
    import com.sulake.habbo.freeflowchat.viewer.visualization.style._SafeStr_3335;
    import flash.display.Sprite;
    import flash.text.TextFormat;
    import flash.text.StyleSheet;
    import flash.display.BitmapData;
    import flash.geom.Point;
    import flash.geom.Rectangle;

    public class BlankStyle implements _SafeStr_3335 
    {


        public function getNewBackgroundSprite(_arg_1:uint=0xFFFFFF):Sprite
        {
            var _local_2:Sprite = new Sprite();
            _local_2.graphics.clear();
            _local_2.graphics.beginFill(0, 0);
            _local_2.graphics.drawRect(0, 0, 20, (19 + 10));
            _local_2.graphics.endFill();
            return (_local_2);
        }

        public function get textFormat():TextFormat
        {
            return (new TextFormat());
        }

        public function get styleSheet():StyleSheet
        {
            return (null);
        }

        public function get pointer():BitmapData
        {
            return (new BitmapData(1, 10, true, 0));
        }

        public function get pointerOffsetToBubbleBottom():int
        {
            return (19);
        }

        public function get faceOffset():Point
        {
            return (null);
        }

        public function get isAnonymous():Boolean
        {
            return (true);
        }

        public function get isSystemStyle():Boolean
        {
            return (true);
        }

        public function get textFieldMargins():Rectangle
        {
            return (new Rectangle(0, 0, 0, 0));
        }

        public function get overlap():Rectangle
        {
            return (new Rectangle(0, 0, 0, 0));
        }

        public function get allowHTML():Boolean
        {
            return (false);
        }


    }
}//package com.sulake.habbo.freeflowchat.viewer.simulation

// _SafeStr_3335 = "_-sO" (String#7785, DoABC#4)


