// by nota

//com.sulake.habbo.game.snowwar.gameobjects.TreeGameObject

package com.sulake.habbo.game.snowwar.gameobjects
{
    import com.sulake.habbo.game.snowwar.Tile;
    import com.sulake.habbo.game.snowwar.utils.Direction8;
    import com.sulake.habbo.game.snowwar.utils.Direction360;
    import _-kg.TreeGameObjectData;
    import com.sulake.habbo.game.snowwar._SafeStr_3310;
    import com.sulake.core.runtime.exceptions.Exception;
    import com.sulake.habbo.game.snowwar.arena._SafeStr_3309;
    import com.sulake.habbo.game.snowwar.utils.Location3D;

    public class TreeGameObject extends SnowWarGameObject 
    {

        private static const NO_BOUNDING_DATA:Array = [0];
        private static const BOUNDING_DATA:Array = [((3200 - SnowBallGameObject.BOUNDING_DATA[0]) - 1)];

        private var _SafeStr_6532:int;
        private var _SafeStr_6531:Tile;
        private var _direction8:Direction8;
        private var _direction360:Direction360;
        private var _SafeStr_4234:int;
        private var _SafeStr_6530:int;
        private var _hits:int;

        public function TreeGameObject(_arg_1:TreeGameObjectData, _arg_2:_SafeStr_3310)
        {
            super(_arg_1.id, false);
            isActive = true;
            _SafeStr_6531 = _arg_2.getTileAt(Tile.convertToTileX(_arg_1.locationX3D), Tile.convertToTileY(_arg_1.locationY3D));
            _direction8 = Direction8.getDirection8(_arg_1.direction);
            _direction360 = new Direction360(Direction360.direction8ToDirection360Value(_direction8));
            _SafeStr_6532 = _arg_1.fuseObjectId;
            _SafeStr_4234 = _arg_1.height;
            _hits = _arg_1.hits;
            _SafeStr_6530 = _arg_1.maxHits;
            if (_hits < _SafeStr_6530)
            {
                _arg_2.addGameObjectToTile(this);
            };
            _SafeStr_6531.addToHeight(-(_SafeStr_4234));
            _SafeStr_6531.blocked = true;
        }

        override public function get numberOfVariables():int
        {
            return (9);
        }

        override public function getVariable(_arg_1:int):int
        {
            switch (_arg_1)
            {
                case 0:
                    return (2);
                case 1:
                    return (gameObjectId);
                case 2:
                    return (_SafeStr_6531.location.x);
                case 3:
                    return (_SafeStr_6531.location.y);
                case 4:
                    return (_direction8.intValue());
                case 5:
                    return (_SafeStr_4234);
                case 6:
                    return (_SafeStr_6532);
                case 7:
                    return (_SafeStr_6530);
                case 8:
                    return (_hits);
                default:
                    throw (new Exception(("No such variable:" + _arg_1)));
            };
        }

        override public function get boundingType():int
        {
            return (2);
        }

        override public function subturn(_arg_1:_SafeStr_3309):void
        {
        }

        override public function get boundingData():Array
        {
            if (_hits < _SafeStr_6530)
            {
                return (BOUNDING_DATA);
            };
            return (NO_BOUNDING_DATA);
        }

        override public function get location3D():Location3D
        {
            return (_SafeStr_6531.location);
        }

        override public function get direction360():Direction360
        {
            return (_direction360);
        }

        override public function onSnowBallHit(_arg_1:_SafeStr_3310, _arg_2:SnowBallGameObject):void
        {
            if (_hits < _SafeStr_6530)
            {
                _hits++;
            };
            if (_hits >= _SafeStr_6530)
            {
                _SafeStr_6531.removeGameObject();
            };
        }

        public function get maxHits():int
        {
            return (_SafeStr_6530);
        }

        public function get hits():int
        {
            return (_hits);
        }

        public function get fuseObjectId():int
        {
            return (_SafeStr_6532);
        }

        override public function get collisionHeight():int
        {
            return (_SafeStr_4234);
        }


    }
}//package com.sulake.habbo.game.snowwar.gameobjects

// _SafeStr_3309 = "_-tx" (String#2281, DoABC#4)
// _SafeStr_3310 = "_-M1m" (String#2514, DoABC#4)
// _SafeStr_4234 = "_-z1j" (String#771, DoABC#4)
// _SafeStr_6530 = "_-e16" (String#8537, DoABC#4)
// _SafeStr_6531 = "_-b1X" (String#8176, DoABC#4)
// _SafeStr_6532 = "_-Bt" (String#6983, DoABC#4)


