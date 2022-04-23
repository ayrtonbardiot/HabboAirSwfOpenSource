// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.game.snowwar.Tile

package com.sulake.habbo.game.snowwar
{
    import com.sulake.habbo.game.snowwar.utils._SafeStr_3331;
    import com.sulake.habbo.game.snowwar.utils._SafeStr_3442;
    import com.sulake.habbo.game.snowwar.utils.Location3D;
    import com.sulake.habbo.game.snowwar.gameobjects.SnowWarGameObject;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.data.FuseObjectData;
    import com.sulake.habbo.game.snowwar.utils.Direction8;
    import com.sulake.habbo.game.snowwar.arena.IGameObject;
    import com.sulake.habbo.game.snowwar.gameobjects.HumanGameObject;
    import com.sulake.habbo.game.snowwar.utils._SafeStr_3330;

    public class Tile extends _SafeStr_3331 
    {

        public static const TILE_WIDTH:int = 3200;
        public static const TILE_HALFWIDTH:int = _SafeStr_3442.javaDiv((3200 / 2));
        public static const TILE_ONEANDHALFWIDTH:int = (3200 + TILE_HALFWIDTH);
        public static const TILE_DIAMETER:int = Math.sqrt(20480000);

        private var _location:Location3D;
        private var _SafeStr_5941:Array;
        private var _gameObject:SnowWarGameObject;
        private var _fuseLocation:Array;
        private var _SafeStr_5940:Array;
        private var _SafeStr_5942:Boolean;
        private var _SafeStr_4234:int;

        public function Tile(_arg_1:int, _arg_2:int)
        {
            _SafeStr_5941 = [];
            _fuseLocation = [_arg_1, _arg_2, 0];
            _location = new Location3D((_arg_1 * 3200), (_arg_2 * 3200), 0);
            _SafeStr_5940 = [];
        }

        public static function convertToTileX(_arg_1:int):int
        {
            return (_SafeStr_3442.javaDiv(((_arg_1 + Tile.TILE_HALFWIDTH) / 3200)));
        }

        public static function convertToTileY(_arg_1:int):int
        {
            return (_SafeStr_3442.javaDiv(((_arg_1 + Tile.TILE_HALFWIDTH) / 3200)));
        }

        public static function convertFromTileX(_arg_1:int):int
        {
            return (_arg_1 * 3200);
        }

        public static function convertFromTileY(_arg_1:int):int
        {
            return (_arg_1 * 3200);
        }


        override public function dispose():void
        {
            super.dispose();
            if (_location != null)
            {
                _location.dispose();
                _location = null;
            };
            _SafeStr_5941 = [];
            _gameObject = null;
            _fuseLocation = [];
            _SafeStr_5940 = [];
            _SafeStr_5942 = false;
        }

        public function get fuseObjects():Array
        {
            return (_SafeStr_5940);
        }

        public function addFuseObject(_arg_1:FuseObjectData):void
        {
            fuseObjects.push(_arg_1);
            addToHeight(_arg_1.height);
        }

        public function addToHeight(_arg_1:int):void
        {
            _SafeStr_4234 = (_SafeStr_4234 + _arg_1);
            if (_SafeStr_4234 < 0)
            {
                _SafeStr_4234 = 0;
            };
        }

        public function get fuseLocation():Array
        {
            return (_fuseLocation);
        }

        public function get location():Location3D
        {
            return (_location);
        }

        public function locationIsInTileRange(_arg_1:Location3D):Boolean
        {
            var _local_2:int = (_location.x - _arg_1.x);
            if (_local_2 < 0)
            {
                _local_2 = -(_local_2);
            };
            var _local_3:int = (_location.y - _arg_1.y);
            if (_local_3 < 0)
            {
                _local_3 = -(_local_3);
            };
            return ((_local_2 < TILE_HALFWIDTH) && (_local_3 < TILE_HALFWIDTH));
        }

        public function linkTile(_arg_1:Tile, _arg_2:Direction8):void
        {
            createLinkToTile(_arg_1, _arg_2);
            _arg_1.createLinkToTile(this, _arg_2.oppositeDirection());
        }

        private function createLinkToTile(_arg_1:Tile, _arg_2:Direction8):void
        {
            _SafeStr_5941[_arg_2.intValue()] = _arg_1;
        }

        public function getTileInDirection(_arg_1:Direction8):Tile
        {
            return (_SafeStr_5941[_arg_1.intValue()]);
        }

        public function canMoveTo(_arg_1:IGameObject):Boolean
        {
            var _local_2:Boolean;
            if (_arg_1)
            {
                _local_2 = (((!(occupyingHuman == null)) && (_arg_1.isGhost)) && (occupyingHuman.ghostObjectId == _arg_1.gameObjectId));
            };
            var _local_3:Boolean;
            if (fuseObjects.length == 1)
            {
                _local_3 = (!((fuseObjects[0] as FuseObjectData).canStandOn));
            }
            else
            {
                if (fuseObjects.length > 1)
                {
                    _local_3 = true;
                };
            };
            return (((!(_local_3)) && ((_gameObject == null) || (_local_2))) && (!(_SafeStr_5942)));
        }

        public function addGameObject(_arg_1:SnowWarGameObject):Boolean
        {
            var _local_2:Boolean;
            if (!_gameObject)
            {
                _gameObject = _arg_1;
                _local_2 = true;
            };
            return (_local_2);
        }

        public function removeGameObject():SnowWarGameObject
        {
            var _local_1:SnowWarGameObject;
            if (_gameObject)
            {
                _local_1 = _gameObject;
                _gameObject = null;
            };
            return (_local_1);
        }

        public function get gameObject():SnowWarGameObject
        {
            return (_gameObject);
        }

        public function get occupyingHuman():HumanGameObject
        {
            if (((_gameObject) && (_gameObject is HumanGameObject)))
            {
                return (gameObject as HumanGameObject);
            };
            return (null);
        }

        public function removeOccupyingHuman():HumanGameObject
        {
            var _local_1:HumanGameObject = occupyingHuman;
            if (_local_1)
            {
                _gameObject = null;
            };
            return (_local_1);
        }

        override public function distanceTo(_arg_1:_SafeStr_3330):int
        {
            var _local_2:Tile = (_arg_1 as Tile);
            return (_location.distanceTo(_local_2.location));
        }

        override public function directionTo(_arg_1:_SafeStr_3330):Direction8
        {
            var _local_2:Tile = (_arg_1 as Tile);
            return (_location.directionTo(_local_2.location));
        }

        override public function getNodeAt(_arg_1:Direction8):_SafeStr_3330
        {
            return (_SafeStr_5941[_arg_1.intValue()]);
        }

        override public function directionIsBlocked(_arg_1:Direction8, _arg_2:IGameObject):Boolean
        {
            return (canMoveTo(_arg_2));
        }

        override public function getPathCost(_arg_1:Direction8, _arg_2:IGameObject):int
        {
            if (_arg_1.isDiagonal())
            {
                return (3200);
            };
            return (TILE_DIAMETER);
        }

        public function get height():int
        {
            return (_SafeStr_4234);
        }

        public function toString():String
        {
            return (((((" X:" + _location.x) + " Y:") + _location.y) + " Z:") + _location.z);
        }

        public function set blocked(_arg_1:Boolean):void
        {
            _SafeStr_5942 = _arg_1;
        }


    }
}//package com.sulake.habbo.game.snowwar

// _SafeStr_3330 = "_-S1s" (String#4225, DoABC#4)
// _SafeStr_3331 = "_-S1V" (String#12367, DoABC#4)
// _SafeStr_3442 = "_-2I" (String#2362, DoABC#4)
// _SafeStr_4234 = "_-z1j" (String#771, DoABC#4)
// _SafeStr_5940 = "_-69" (String#13091, DoABC#4)
// _SafeStr_5941 = "_-xN" (String#9535, DoABC#4)
// _SafeStr_5942 = "_-wK" (String#11889, DoABC#4)


