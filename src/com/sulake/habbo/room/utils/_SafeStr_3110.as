// by nota

//com.sulake.habbo.room.utils._SafeStr_3110

package com.sulake.habbo.room.utils
{
    import com.sulake.core.utils._SafeStr_24;

    [SecureSWF(rename="true")]
    public class _SafeStr_3110 
    {

        private var _SafeStr_3693:int = 0;
        private var _SafeStr_3996:_SafeStr_3178 = null;
        private var _legacyGeometry:_SafeStr_3137 = null;
        private var _SafeStr_3997:_SafeStr_3262 = null;
        private var _SafeStr_3998:_SafeStr_3120 = null;
        private var _selectedObject:_SafeStr_3172 = null;
        private var _placedObject:_SafeStr_3172 = null;
        private var _SafeStr_3999:String = null;
        private var _SafeStr_4000:_SafeStr_24 = new _SafeStr_24();
        private var _SafeStr_4001:_SafeStr_24 = new _SafeStr_24();
        private var _mouseButtonCursorOwners:Array = [];

        public function _SafeStr_3110(_arg_1:int)
        {
            _SafeStr_3693 = _arg_1;
            _legacyGeometry = new _SafeStr_3137();
            _SafeStr_3998 = new _SafeStr_3120();
        }

        public function get roomId():int
        {
            return (_SafeStr_3693);
        }

        public function get furniStackingHeightMap():_SafeStr_3178
        {
            return (_SafeStr_3996);
        }

        public function set furniStackingHeightMap(_arg_1:_SafeStr_3178):void
        {
            if (_SafeStr_3996 != null)
            {
                _SafeStr_3996.dispose();
            };
            _SafeStr_3996 = _arg_1;
            if (_SafeStr_3997)
            {
                _SafeStr_3997.dispose();
            };
            if (_SafeStr_3996)
            {
                _SafeStr_3997 = new _SafeStr_3262(_SafeStr_3996.width, _SafeStr_3996.height);
            };
        }

        public function get legacyGeometry():_SafeStr_3137
        {
            return (_legacyGeometry);
        }

        public function get tileObjectMap():_SafeStr_3262
        {
            return (_SafeStr_3997);
        }

        public function get roomCamera():_SafeStr_3120
        {
            return (_SafeStr_3998);
        }

        public function get worldType():String
        {
            return (_SafeStr_3999);
        }

        public function set worldType(_arg_1:String):void
        {
            _SafeStr_3999 = _arg_1;
        }

        public function get selectedObject():_SafeStr_3172
        {
            return (_selectedObject);
        }

        public function set selectedObject(_arg_1:_SafeStr_3172):void
        {
            if (_selectedObject != null)
            {
                _selectedObject.dispose();
            };
            _selectedObject = _arg_1;
        }

        public function get placedObject():_SafeStr_3172
        {
            return (_placedObject);
        }

        public function set placedObject(_arg_1:_SafeStr_3172):void
        {
            if (_placedObject != null)
            {
                _placedObject.dispose();
            };
            _placedObject = _arg_1;
        }

        public function dispose():void
        {
            if (_SafeStr_3996 != null)
            {
                _SafeStr_3996.dispose();
                _SafeStr_3996 = null;
            };
            if (_legacyGeometry != null)
            {
                _legacyGeometry.dispose();
                _legacyGeometry = null;
            };
            if (_SafeStr_3998 != null)
            {
                _SafeStr_3998.dispose();
                _SafeStr_3998 = null;
            };
            if (_selectedObject != null)
            {
                _selectedObject.dispose();
                _selectedObject = null;
            };
            if (_placedObject != null)
            {
                _placedObject.dispose();
                _placedObject = null;
            };
            if (_SafeStr_4000 != null)
            {
                _SafeStr_4000.dispose();
                _SafeStr_4000 = null;
            };
            if (_SafeStr_4001 != null)
            {
                _SafeStr_4001.dispose();
                _SafeStr_4001 = null;
            };
            if (_SafeStr_3997 != null)
            {
                _SafeStr_3997.dispose();
                _SafeStr_3997 = null;
            };
        }

        public function addFurnitureData(_arg_1:_SafeStr_3247):void
        {
            if (_arg_1 != null)
            {
                _SafeStr_4000.remove(_arg_1.id);
                _SafeStr_4000.add(_arg_1.id, _arg_1);
            };
        }

        public function getFurnitureData():_SafeStr_3247
        {
            if (_SafeStr_4000.length > 0)
            {
                return (getFurnitureDataWithId(_SafeStr_4000.getKey(0)));
            };
            return (null);
        }

        public function getFurnitureDataWithId(_arg_1:int):_SafeStr_3247
        {
            return (_SafeStr_4000.remove(_arg_1));
        }

        public function addWallItemData(_arg_1:_SafeStr_3247):void
        {
            if (_arg_1 != null)
            {
                _SafeStr_4001.remove(_arg_1.id);
                _SafeStr_4001.add(_arg_1.id, _arg_1);
            };
        }

        public function getWallItemData():_SafeStr_3247
        {
            if (_SafeStr_4001.length > 0)
            {
                return (getWallItemDataWithId(_SafeStr_4001.getKey(0)));
            };
            return (null);
        }

        public function getWallItemDataWithId(_arg_1:int):_SafeStr_3247
        {
            return (_SafeStr_4001.remove(_arg_1));
        }

        public function addButtonMouseCursorOwner(_arg_1:String):Boolean
        {
            var _local_2:int = _mouseButtonCursorOwners.indexOf(_arg_1);
            if (_local_2 == -1)
            {
                _mouseButtonCursorOwners.push(_arg_1);
                return (true);
            };
            return (false);
        }

        public function removeButtonMouseCursorOwner(_arg_1:String):Boolean
        {
            var _local_2:int = _mouseButtonCursorOwners.indexOf(_arg_1);
            if (_local_2 > -1)
            {
                _mouseButtonCursorOwners.splice(_local_2, 1);
                return (true);
            };
            return (false);
        }

        public function hasButtonMouseCursorOwners():Boolean
        {
            return (_mouseButtonCursorOwners.length > 0);
        }


    }
}//package com.sulake.habbo.room.utils

// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3110 = "_-s1g" (String#2208, DoABC#4)
// _SafeStr_3120 = "_-F10" (String#4637, DoABC#4)
// _SafeStr_3137 = "_-71l" (String#4564, DoABC#4)
// _SafeStr_3172 = "_-eb" (String#2240, DoABC#4)
// _SafeStr_3178 = "_-pR" (String#3386, DoABC#4)
// _SafeStr_3247 = "_-o19" (String#3004, DoABC#4)
// _SafeStr_3262 = "_-m1x" (String#5603, DoABC#4)
// _SafeStr_3693 = "_-KI" (String#730, DoABC#4)
// _SafeStr_3996 = "_-C14" (String#5668, DoABC#4)
// _SafeStr_3997 = "_-226" (String#3834, DoABC#4)
// _SafeStr_3998 = "_-pA" (String#8908, DoABC#4)
// _SafeStr_3999 = "_-y1c" (String#19876, DoABC#4)
// _SafeStr_4000 = "_-cx" (String#6280, DoABC#4)
// _SafeStr_4001 = "_-ta" (String#5988, DoABC#4)


