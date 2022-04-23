// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.visualization.room.TileCursorVisualization

package com.sulake.habbo.room.object.visualization.room
{
    import com.sulake.habbo.room.object.visualization.furniture.AnimatedFurnitureVisualization;

    public class TileCursorVisualization extends AnimatedFurnitureVisualization 
    {

        private var _SafeStr_4809:Number = 0;


        public function get tileHeight():Number
        {
            return (_SafeStr_4809);
        }

        public function set tileHeight(_arg_1:Number):void
        {
            _SafeStr_4809 = _arg_1;
        }

        override protected function getSpriteYOffset(_arg_1:int, _arg_2:int, _arg_3:int):int
        {
            if (_arg_3 == 1)
            {
                tileHeight = object.getModel().getNumber("tile_cursor_height");
                return (-(tileHeight) * (_arg_1 / 2));
            };
            return (super.getSpriteYOffset(_arg_1, _arg_2, _arg_3));
        }


    }
}//package com.sulake.habbo.room.object.visualization.room

// _SafeStr_4809 = "_-qT" (String#17860, DoABC#4)


