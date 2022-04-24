// by nota

//com.sulake.habbo.game.snowwar.gameobjects.SnowballPileGameObject

package com.sulake.habbo.game.snowwar.gameobjects
{
    import com.sulake.habbo.game.snowwar.Tile;
    import _-kg.SnowballPileGameObjectData;
    import com.sulake.habbo.game.snowwar._SafeStr_3310;
    import com.sulake.core.runtime.exceptions.Exception;

    public class SnowballPileGameObject extends SnowballGivingGameObject 
    {

        private static const BOUNDING_DATA_PER_SNOWBALL:int = 100;

        private var _SafeStr_6538:Array;
        private var _maxSnowballs:int;

        public function SnowballPileGameObject(_arg_1:SnowballPileGameObjectData, _arg_2:_SafeStr_3310)
        {
            super(_arg_1.id, _arg_1.snowballCount, _arg_2.getTileAt(Tile.convertToTileX(_arg_1.locationX3D), Tile.convertToTileY(_arg_1.locationY3D)), _arg_1.fuseObjectId);
            _maxSnowballs = _arg_1.maxSnowballs;
            if (_SafeStr_6375 > 0)
            {
                _arg_2.addGameObjectToTile(this);
            };
            _SafeStr_6538 = [(_SafeStr_6375 * 100)];
        }

        override public function get numberOfVariables():int
        {
            return (7);
        }

        override public function getVariable(_arg_1:int):int
        {
            switch (_arg_1)
            {
                case 0:
                    return (3);
                case 1:
                    return (_SafeStr_6246);
                case 2:
                    return (_SafeStr_6371.location.x);
                case 3:
                    return (_SafeStr_6371.location.y);
                case 4:
                    return (_maxSnowballs);
                case 5:
                    return (_SafeStr_6375);
                case 6:
                    return (_SafeStr_6532);
                default:
                    throw (new Exception(("No such variable:" + _arg_1)));
            };
        }

        override public function get boundingData():Array
        {
            return (_SafeStr_6538);
        }

        override protected function onSnowballPickup():void
        {
            _SafeStr_6538 = [(_SafeStr_6375 * 100)];
            if (_SafeStr_6375 <= 0)
            {
                _SafeStr_6371.removeGameObject();
            };
        }

        public function get maxSnowballs():int
        {
            return (_maxSnowballs);
        }


    }
}//package com.sulake.habbo.game.snowwar.gameobjects

// _SafeStr_3310 = "_-M1m" (String#2514, DoABC#4)
// _SafeStr_6246 = "_-y1A" (String#4929, DoABC#4)
// _SafeStr_6371 = "_-EU" (String#2086, DoABC#4)
// _SafeStr_6375 = "_-Jv" (String#2125, DoABC#4)
// _SafeStr_6532 = "_-Bt" (String#6983, DoABC#4)
// _SafeStr_6538 = "_-n15" (String#12103, DoABC#4)


