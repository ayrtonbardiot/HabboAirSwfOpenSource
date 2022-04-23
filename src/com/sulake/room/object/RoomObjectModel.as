// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.room.object.RoomObjectModel

package com.sulake.room.object
{
    import flash.utils.Dictionary;
    import com.sulake.core.utils._SafeStr_24;

    public class RoomObjectModel implements IRoomObjectModelController 
    {

        private static const MAP_KEYS_PREFIX:String = "ROMC_MAP_KEYS_";
        private static const MAP_VALUES_PREFIX:String = "ROMC_MAP_VALUES_";

        private var _SafeStr_4603:Dictionary;
        private var _SafeStr_4604:Dictionary;
        private var _SafeStr_6904:Dictionary;
        private var _SafeStr_6905:Dictionary;
        private var _SafeStr_4605:Array;
        private var _SafeStr_4606:Array;
        private var _SafeStr_6906:Array;
        private var _SafeStr_6907:Array;
        private var _SafeStr_4165:int;

        public function RoomObjectModel()
        {
            _SafeStr_4603 = new Dictionary();
            _SafeStr_4604 = new Dictionary();
            _SafeStr_6904 = new Dictionary();
            _SafeStr_6905 = new Dictionary();
            _SafeStr_4605 = [];
            _SafeStr_4606 = [];
            _SafeStr_6906 = [];
            _SafeStr_6907 = [];
            _SafeStr_4165 = 0;
        }

        public function dispose():void
        {
            var _local_1:* = null;
            if (_SafeStr_4603 != null)
            {
                for (_local_1 in _SafeStr_4603)
                {
                    delete _SafeStr_4603[_local_1];
                };
                _SafeStr_4603 = null;
            };
            if (_SafeStr_4604 != null)
            {
                for (_local_1 in _SafeStr_4604)
                {
                    delete _SafeStr_4604[_local_1];
                };
                _SafeStr_4604 = null;
            };
            if (_SafeStr_6904 != null)
            {
                for (_local_1 in _SafeStr_6904)
                {
                    delete _SafeStr_6904[_local_1];
                };
                _SafeStr_6904 = null;
            };
            if (_SafeStr_6905 != null)
            {
                for (_local_1 in _SafeStr_6905)
                {
                    delete _SafeStr_6905[_local_1];
                };
                _SafeStr_6905 = null;
            };
            _SafeStr_4606 = [];
            _SafeStr_4605 = [];
            _SafeStr_6907 = [];
            _SafeStr_6906 = [];
        }

        public function hasNumber(_arg_1:String):Boolean
        {
            return (!(_SafeStr_4603[_arg_1] == null));
        }

        public function hasNumberArray(_arg_1:String):Boolean
        {
            return (!(_SafeStr_6904[_arg_1] == null));
        }

        public function hasString(_arg_1:String):Boolean
        {
            return (!(_SafeStr_4604[_arg_1] == null));
        }

        public function hasStringArray(_arg_1:String):Boolean
        {
            return (!(_SafeStr_6905[_arg_1] == null));
        }

        public function getNumber(_arg_1:String):Number
        {
            return (_SafeStr_4603[_arg_1]);
        }

        public function getString(_arg_1:String):String
        {
            return (_SafeStr_4604[_arg_1]);
        }

        public function getNumberArray(_arg_1:String):Array
        {
            var _local_2:Array = _SafeStr_6904[_arg_1];
            if (_local_2 != null)
            {
                _local_2 = _local_2.slice();
            };
            return (_local_2);
        }

        public function getStringArray(_arg_1:String):Array
        {
            var _local_2:Array = _SafeStr_6905[_arg_1];
            if (_local_2 != null)
            {
                _local_2 = _local_2.slice();
            };
            return (_local_2);
        }

        public function getStringToStringMap(_arg_1:String):_SafeStr_24
        {
            var _local_4:int;
            var _local_5:_SafeStr_24 = new _SafeStr_24();
            var _local_2:Array = getStringArray(("ROMC_MAP_KEYS_" + _arg_1));
            var _local_3:Array = getStringArray(("ROMC_MAP_VALUES_" + _arg_1));
            if ((((!(_local_2 == null)) && (!(_local_3 == null))) && (_local_2.length == _local_3.length)))
            {
                _local_4 = 0;
                while (_local_4 < _local_2.length)
                {
                    _local_5.add(_local_2[_local_4], _local_3[_local_4]);
                    _local_4++;
                };
            };
            return (_local_5);
        }

        public function setNumber(_arg_1:String, _arg_2:Number, _arg_3:Boolean=false):void
        {
            if (_SafeStr_4605.indexOf(_arg_1) >= 0)
            {
                return;
            };
            if (_arg_3)
            {
                _SafeStr_4605.push(_arg_1);
            };
            if (_SafeStr_4603[_arg_1] != _arg_2)
            {
                _SafeStr_4603[_arg_1] = _arg_2;
                _SafeStr_4165++;
            };
        }

        public function setString(_arg_1:String, _arg_2:String, _arg_3:Boolean=false):void
        {
            if (_SafeStr_4606.indexOf(_arg_1) >= 0)
            {
                return;
            };
            if (_arg_3)
            {
                _SafeStr_4606.push(_arg_1);
            };
            if (_SafeStr_4604[_arg_1] != _arg_2)
            {
                _SafeStr_4604[_arg_1] = _arg_2;
                _SafeStr_4165++;
            };
        }

        public function setNumberArray(_arg_1:String, _arg_2:Array, _arg_3:Boolean=false):void
        {
            if (_arg_2 == null)
            {
                return;
            };
            if (_SafeStr_6906.indexOf(_arg_1) >= 0)
            {
                return;
            };
            if (_arg_3)
            {
                _SafeStr_6906.push(_arg_1);
            };
            var _local_6:Array = [];
            var _local_7:int;
            _local_7 = 0;
            while (_local_7 < _arg_2.length)
            {
                if ((_arg_2[_local_7] is Number))
                {
                    _local_6.push(_arg_2[_local_7]);
                };
                _local_7++;
            };
            var _local_5:Array = _SafeStr_6904[_arg_1];
            var _local_4:Boolean = true;
            if (((!(_local_5 == null)) && (_local_5.length == _local_6.length)))
            {
                _local_7 = (_local_6.length - 1);
                while (_local_7 >= 0)
                {
                    if ((_local_6[_local_7] as Number) != (_local_5[_local_7] as Number))
                    {
                        _local_4 = false;
                        break;
                    };
                    _local_7--;
                };
            }
            else
            {
                _local_4 = false;
            };
            if (_local_4)
            {
                return;
            };
            _SafeStr_6904[_arg_1] = _local_6;
            _SafeStr_4165++;
        }

        public function setStringArray(_arg_1:String, _arg_2:Array, _arg_3:Boolean=false):void
        {
            if (_arg_2 == null)
            {
                return;
            };
            if (_SafeStr_6907.indexOf(_arg_1) >= 0)
            {
                return;
            };
            if (_arg_3)
            {
                _SafeStr_6907.push(_arg_1);
            };
            var _local_6:Array = [];
            var _local_7:int;
            _local_7 = 0;
            while (_local_7 < _arg_2.length)
            {
                if ((_arg_2[_local_7] is String))
                {
                    _local_6.push(_arg_2[_local_7]);
                };
                _local_7++;
            };
            var _local_5:Array = _SafeStr_6905[_arg_1];
            var _local_4:Boolean = true;
            if (((!(_local_5 == null)) && (_local_5.length == _local_6.length)))
            {
                _local_7 = (_local_6.length - 1);
                while (_local_7 >= 0)
                {
                    if ((_local_6[_local_7] as String) != (_local_5[_local_7] as String))
                    {
                        _local_4 = false;
                        break;
                    };
                    _local_7--;
                };
            }
            else
            {
                _local_4 = false;
            };
            if (_local_4)
            {
                return;
            };
            _SafeStr_6905[_arg_1] = _local_6;
            _SafeStr_4165++;
        }

        public function setStringToStringMap(_arg_1:String, _arg_2:_SafeStr_24, _arg_3:Boolean=false):void
        {
            if (_arg_2 == null)
            {
                return;
            };
            setStringArray(("ROMC_MAP_KEYS_" + _arg_1), _arg_2.getKeys(), _arg_3);
            setStringArray(("ROMC_MAP_VALUES_" + _arg_1), _arg_2.getValues(), _arg_3);
        }

        public function getUpdateID():int
        {
            return (_SafeStr_4165);
        }


    }
}//package com.sulake.room.object

// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_4165 = "_-e1M" (String#1170, DoABC#4)
// _SafeStr_4603 = "_-m1n" (String#3490, DoABC#4)
// _SafeStr_4604 = "_-AW" (String#3465, DoABC#4)
// _SafeStr_4605 = "_-Ek" (String#5456, DoABC#4)
// _SafeStr_4606 = "_-vB" (String#5213, DoABC#4)
// _SafeStr_6904 = "_-sw" (String#5985, DoABC#4)
// _SafeStr_6905 = "_-Z1c" (String#6198, DoABC#4)
// _SafeStr_6906 = "_-Qz" (String#10954, DoABC#4)
// _SafeStr_6907 = "_-j1Q" (String#11181, DoABC#4)


