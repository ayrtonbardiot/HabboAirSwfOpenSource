// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.game.snowwar.gameobjects.SnowballGivingGameObject

package com.sulake.habbo.game.snowwar.gameobjects
{
    import com.sulake.habbo.game.snowwar.Tile;
    import com.sulake.habbo.game.snowwar.utils.Direction360;
    import com.sulake.habbo.game.snowwar.utils.Location3D;
    import com.sulake.habbo.game.snowwar.arena._SafeStr_3309;
    import com.sulake.habbo.game.snowwar._SafeStr_3310;

    public class SnowballGivingGameObject extends SnowWarGameObject 
    {

        protected var _SafeStr_6532:int;
        protected var _SafeStr_6375:int;
        protected var _SafeStr_6371:Tile;

        public function SnowballGivingGameObject(_arg_1:int, _arg_2:int, _arg_3:Tile, _arg_4:int)
        {
            super(_arg_1, false);
            _active = true;
            _SafeStr_6375 = _arg_2;
            _SafeStr_6371 = _arg_3;
            _SafeStr_6532 = _arg_4;
        }

        override public function dispose():void
        {
            super.dispose();
            _SafeStr_6371 = null;
        }

        override public function get direction360():Direction360
        {
            return (null);
        }

        override public function get boundingType():int
        {
            return (2);
        }

        override public function get location3D():Location3D
        {
            return (_SafeStr_6371.location);
        }

        public function get fuseObjectId():int
        {
            return (_SafeStr_6532);
        }

        public function get snowballCount():int
        {
            return (_SafeStr_6375);
        }

        override public function subturn(_arg_1:_SafeStr_3309):void
        {
        }

        public function pickupSnowballs(_arg_1:int):int
        {
            if (_SafeStr_6375 < _arg_1)
            {
                _arg_1 = _SafeStr_6375;
            };
            _SafeStr_6375 = (_SafeStr_6375 - _arg_1);
            onSnowballPickup();
            return (_arg_1);
        }

        override public function onSnowBallHit(_arg_1:_SafeStr_3310, _arg_2:SnowBallGameObject):void
        {
        }

        protected function onSnowballPickup():void
        {
        }


    }
}//package com.sulake.habbo.game.snowwar.gameobjects

// _SafeStr_3309 = "_-tx" (String#2281, DoABC#4)
// _SafeStr_3310 = "_-M1m" (String#2514, DoABC#4)
// _SafeStr_6371 = "_-EU" (String#2086, DoABC#4)
// _SafeStr_6375 = "_-Jv" (String#2125, DoABC#4)
// _SafeStr_6532 = "_-Bt" (String#6983, DoABC#4)


