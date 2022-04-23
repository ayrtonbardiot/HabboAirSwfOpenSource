// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.game.snowwar.gameobjects.SnowballMachineGameObject

package com.sulake.habbo.game.snowwar.gameobjects
{
    import com.sulake.habbo.game.snowwar.utils.Direction8;
    import com.sulake.habbo.game.snowwar.Tile;
    import _-kg.SnowballMachineGameObjectData;
    import com.sulake.habbo.game.snowwar._SafeStr_3310;
    import com.sulake.core.runtime.exceptions.Exception;

    public class SnowballMachineGameObject extends SnowballGivingGameObject 
    {

        public static var BOUNDING_DATA:Array = [1200];

        private var _maxSnowballs:int;
        private var _currentDirection:Direction8;

        public function SnowballMachineGameObject(_arg_1:SnowballMachineGameObjectData, _arg_2:_SafeStr_3310)
        {
            super(_arg_1.id, _arg_1.snowballCount, _arg_2.getTileAt(Tile.convertToTileX(_arg_1.locationX3D), Tile.convertToTileY(_arg_1.locationY3D)), _arg_1.fuseObjectId);
            _maxSnowballs = _arg_1.maxSnowballs;
            _currentDirection = Direction8.getDirection8(_arg_1.direction);
            _arg_2.addGameObjectToTile(this);
        }

        override public function dispose():void
        {
            super.dispose();
            _currentDirection = null;
        }

        override public function get numberOfVariables():int
        {
            return (8);
        }

        override public function getVariable(_arg_1:int):int
        {
            switch (_arg_1)
            {
                case 0:
                    return (4);
                case 1:
                    return (_SafeStr_6246);
                case 2:
                    return (_SafeStr_6371.location.x);
                case 3:
                    return (_SafeStr_6371.location.y);
                case 4:
                    return (_currentDirection.intValue());
                case 5:
                    return (_maxSnowballs);
                case 6:
                    return (_SafeStr_6375);
                case 7:
                    return (_SafeStr_6532);
                default:
                    throw (new Exception(("No such variable:" + _arg_1)));
            };
        }

        override public function get boundingData():Array
        {
            return (BOUNDING_DATA);
        }

        public function createSnowball():void
        {
            if (_SafeStr_6375 < _maxSnowballs)
            {
                _SafeStr_6375++;
            };
        }


    }
}//package com.sulake.habbo.game.snowwar.gameobjects

// _SafeStr_3310 = "_-M1m" (String#2514, DoABC#4)
// _SafeStr_6246 = "_-y1A" (String#4929, DoABC#4)
// _SafeStr_6371 = "_-EU" (String#2086, DoABC#4)
// _SafeStr_6375 = "_-Jv" (String#2125, DoABC#4)
// _SafeStr_6532 = "_-Bt" (String#6983, DoABC#4)


