// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.RoomWallData

package com.sulake.habbo.room.object
{
    import com.sulake.room.utils.Vector3d;
    import flash.geom.Point;

    public class RoomWallData 
    {

        public static var WALL_DIRECTION_VECTORS:Array = [];
        public static var WALL_NORMAL_VECTORS:Array = [];

        private var _corners:Array = [];
        private var _SafeStr_8888:Array = [];
        private var _directions:Array = [];
        private var _SafeStr_8889:Array = [];
        private var _SafeStr_8890:Array = [];
        private var _borders:Array = [];
        private var _hideWalls:Array = [];
        private var _SafeStr_8891:Array = [];
        private var _SafeStr_8892:Array = [];
        private var _SafeStr_8893:Boolean = false;
        private var _SafeStr_5259:int = 0;

        {
            WALL_DIRECTION_VECTORS.push(new Vector3d(1, 0, 0));
            WALL_DIRECTION_VECTORS.push(new Vector3d(0, 1, 0));
            WALL_DIRECTION_VECTORS.push(new Vector3d(-1, 0, 0));
            WALL_DIRECTION_VECTORS.push(new Vector3d(0, -1, 0));
            WALL_NORMAL_VECTORS.push(new Vector3d(0, 1, 0));
            WALL_NORMAL_VECTORS.push(new Vector3d(-1, 0, 0));
            WALL_NORMAL_VECTORS.push(new Vector3d(0, -1, 0));
            WALL_NORMAL_VECTORS.push(new Vector3d(1, 0, 0));
        }


        public function addWall(_arg_1:Point, _arg_2:int, _arg_3:int, _arg_4:Boolean, _arg_5:Boolean):void
        {
            if (((_SafeStr_8893) || (checkIsNotDuplicate(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5))))
            {
                _corners.push(_arg_1);
                _directions.push(_arg_2);
                _SafeStr_8889.push(_arg_3);
                _borders.push(_arg_4);
                _SafeStr_8890.push(_arg_5);
                _hideWalls.push(false);
                _SafeStr_8891.push(false);
                _SafeStr_8892.push(false);
                _SafeStr_5259++;
            };
        }

        private function checkIsNotDuplicate(_arg_1:Point, _arg_2:int, _arg_3:int, _arg_4:Boolean, _arg_5:Boolean):Boolean
        {
            var _local_6:int;
            _local_6 = 0;
            while (_local_6 < _SafeStr_5259)
            {
                if (((((((_corners[_local_6].x == _arg_1.x) && (_corners[_local_6].y == _arg_1.y)) && (_directions[_local_6] == _arg_2)) && (_SafeStr_8889[_local_6] == _arg_3)) && (_borders[_local_6] == _arg_4)) && (_SafeStr_8890[_local_6] == _arg_5)))
                {
                    return (false);
                };
                _local_6++;
            };
            return (true);
        }

        public function get count():int
        {
            return (_SafeStr_5259);
        }

        public function getCorner(_arg_1:int):Point
        {
            return (_corners[_arg_1]);
        }

        public function getEndPoint(_arg_1:int):Point
        {
            calculateWallEndPoints();
            return (_SafeStr_8888[_arg_1]);
        }

        public function getLength(_arg_1:int):int
        {
            return (_SafeStr_8889[_arg_1]);
        }

        public function getDirection(_arg_1:int):int
        {
            return (_directions[_arg_1]);
        }

        public function getBorder(_arg_1:int):Boolean
        {
            return (_borders[_arg_1]);
        }

        public function getHideWall(_arg_1:int):Boolean
        {
            return (_hideWalls[_arg_1]);
        }

        public function getLeftTurn(_arg_1:int):Boolean
        {
            return (_SafeStr_8890[_arg_1]);
        }

        public function getManuallyLeftCut(_arg_1:int):Boolean
        {
            return (_SafeStr_8891[_arg_1]);
        }

        public function getManuallyRightCut(_arg_1:int):Boolean
        {
            return (_SafeStr_8892[_arg_1]);
        }

        public function setHideWall(_arg_1:int, _arg_2:Boolean):void
        {
            _hideWalls[_arg_1] = _arg_2;
        }

        public function setLength(_arg_1:int, _arg_2:int):void
        {
            if (_arg_2 < _SafeStr_8889[_arg_1])
            {
                _SafeStr_8889[_arg_1] = _arg_2;
                _SafeStr_8892[_arg_1] = true;
            };
        }

        public function moveCorner(_arg_1:int, _arg_2:int):void
        {
            var _local_3:* = null;
            if (((_arg_2 > 0) && (_arg_2 < _SafeStr_8889[_arg_1])))
            {
                _local_3 = WALL_DIRECTION_VECTORS[getDirection(_arg_1)];
                _corners[_arg_1] = _corners[_arg_1].add(new Point((_arg_2 * _local_3.x), (_arg_2 * _local_3.y)));
                var _local_4:* = _arg_1;
                var _local_5:* = (_SafeStr_8889[_local_4] - _arg_2);
                _SafeStr_8889[_local_4] = _local_5;
                _SafeStr_8891[_arg_1] = true;
            };
        }

        private function calculateWallEndPoints():void
        {
            var _local_5:int;
            var _local_3:* = null;
            var _local_1:* = null;
            var _local_2:* = null;
            var _local_4:int;
            if (_SafeStr_8888.length != count)
            {
                _SafeStr_8888 = [];
                _local_5 = 0;
                while (_local_5 < count)
                {
                    _local_3 = getCorner(_local_5);
                    _local_1 = new Point(_local_3.x, _local_3.y);
                    _local_2 = RoomWallData.WALL_DIRECTION_VECTORS[getDirection(_local_5)];
                    _local_4 = getLength(_local_5);
                    _local_1.x = (_local_1.x + (_local_2.x * _local_4));
                    _local_1.y = (_local_1.y + (_local_2.y * _local_4));
                    _SafeStr_8888.push(_local_1);
                    _local_5++;
                };
            };
        }


    }
}//package com.sulake.habbo.room.object

// _SafeStr_5259 = "_-61s" (String#6975, DoABC#3)
// _SafeStr_8888 = "_-H5" (String#7688, DoABC#3)
// _SafeStr_8889 = "_-Z1Y" (String#8903, DoABC#3)
// _SafeStr_8890 = "_-KS" (String#7915, DoABC#3)
// _SafeStr_8891 = "_-Ut" (String#8598, DoABC#3)
// _SafeStr_8892 = "_-Bc" (String#7339, DoABC#3)
// _SafeStr_8893 = "_-rs" (String#10170, DoABC#3)


