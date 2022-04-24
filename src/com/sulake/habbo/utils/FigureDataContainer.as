// by nota

//com.sulake.habbo.utils.FigureDataContainer

package com.sulake.habbo.utils
{
    import flash.utils.Dictionary;

    public class FigureDataContainer 
    {

        public static const MALE:String = "M";
        public static const _SafeStr_8291:String = "F";
        public static const _SafeStr_8292:String = "U";
        public static const SCALE:String = "h";
        public static const ACTION:String = "std";
        public static const DEFAULT_FRAME:String = "0";
        public static const _SafeStr_8288:String = "hd";
        public static const HAIR:String = "hr";
        public static const HAT:String = "ha";
        public static const HEAD_ACCESSORIES:String = "he";
        public static const EYE_ACCESSORIES:String = "ea";
        public static const FACE_ACCESSORIES:String = "fa";
        public static const JACKET:String = "cc";
        public static const SHIRT:String = "ch";
        public static const CHEST_ACCESSORIES:String = "ca";
        public static const CHEST_PRINTS:String = "cp";
        public static const TROUSERS:String = "lg";
        public static const SHOES:String = "sh";
        public static const TROUSER_ACCESSORIES:String = "wa";
        private static const BLOCKED_FX_TYPES:Array = [28, 29, 30, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 68];

        private var _SafeStr_3740:Dictionary;
        private var _colors:Dictionary;
        private var _SafeStr_3834:String = "M";
        private var _SafeStr_4036:Boolean;
        private var _SafeStr_5754:int = -1;


        public function loadAvatarData(_arg_1:String, _arg_2:String):void
        {
            _SafeStr_3740 = new Dictionary();
            _colors = new Dictionary();
            _SafeStr_3834 = _arg_2;
            parseFigureString(_arg_1);
        }

        public function dispose():void
        {
            _SafeStr_3740 = null;
            _colors = null;
            _SafeStr_4036 = true;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4036);
        }

        private function parseFigureString(_arg_1:String):void
        {
            var _local_2:* = null;
            var _local_6:* = null;
            var _local_3:int;
            var _local_5:* = null;
            var _local_4:int;
            if (_arg_1 == null)
            {
                return;
            };
            for each (var _local_7:String in _arg_1.split("."))
            {
                _local_2 = _local_7.split("-");
                if (_local_2.length > 0)
                {
                    _local_6 = String(_local_2[0]);
                    _local_3 = parseInt(_local_2[1]);
                    _local_5 = [];
                    _local_4 = 2;
                    while (_local_4 < _local_2.length)
                    {
                        _local_5.push(parseInt(_local_2[_local_4]));
                        _local_4++;
                    };
                    if (_local_5.length == 0)
                    {
                        _local_5.push(0);
                    };
                    savePartSetId(_local_6, _local_3, false);
                    savePartSetColourId(_local_6, _local_5, false);
                };
            };
        }

        public function hasSetType(_arg_1:String):Boolean
        {
            return (!(_SafeStr_3740[_arg_1] == null));
        }

        public function getPartSetId(_arg_1:String):int
        {
            if (_SafeStr_3740[_arg_1] != null)
            {
                return (_SafeStr_3740[_arg_1]);
            };
            return (-1);
        }

        public function getColourIds(_arg_1:String):Array
        {
            if (_colors[_arg_1] != null)
            {
                return (_colors[_arg_1]);
            };
            return ([]);
        }

        public function getFigureString():String
        {
            var _local_2:* = null;
            var _local_8:* = null;
            var _local_3:* = null;
            var _local_4:int;
            var _local_5:int;
            var _local_6:String = "";
            var _local_1:Array = [];
            for (var _local_7:String in _SafeStr_3740)
            {
                if (_SafeStr_3740[_local_7] != null)
                {
                    _local_2 = _SafeStr_3740[_local_7];
                    _local_8 = (_colors[_local_7] as Array);
                    _local_3 = ((_local_7 + "-") + _local_2);
                    if (_local_8)
                    {
                        _local_4 = 0;
                        while (_local_4 < _local_8.length)
                        {
                            _local_3 = (_local_3 + ("-" + _local_8[_local_4]));
                            _local_4++;
                        };
                    };
                    _local_1.push(_local_3);
                };
            };
            _local_5 = 0;
            while (_local_5 < _local_1.length)
            {
                _local_6 = (_local_6 + _local_1[_local_5]);
                if (_local_5 < (_local_1.length - 1))
                {
                    _local_6 = (_local_6 + ".");
                };
                _local_5++;
            };
            return (_local_6);
        }

        public function savePartData(_arg_1:String, _arg_2:int, _arg_3:Array, _arg_4:Boolean=false):void
        {
            savePartSetId(_arg_1, _arg_2, _arg_4);
            savePartSetColourId(_arg_1, _arg_3, _arg_4);
        }

        private function savePartSetId(_arg_1:String, _arg_2:int, _arg_3:Boolean=true):void
        {
            switch (_arg_1)
            {
                case "hd":
                case "hr":
                case "ha":
                case "he":
                case "ea":
                case "fa":
                case "ch":
                case "cc":
                case "ca":
                case "cp":
                case "lg":
                case "sh":
                case "wa":
                    if (_arg_2 >= 0)
                    {
                        _SafeStr_3740[_arg_1] = _arg_2;
                    }
                    else
                    {
                        delete _SafeStr_3740[_arg_1];
                    };
                    return;
                default:
                    _SafeStr_14.log(((("[FigureData] Unknown partset: " + _arg_1) + ", can not store id: ") + _arg_2));
                    return;
            };
        }

        public function savePartSetColourId(_arg_1:String, _arg_2:Array, _arg_3:Boolean=true):void
        {
            switch (_arg_1)
            {
                case "hd":
                case "hr":
                case "ha":
                case "he":
                case "ea":
                case "fa":
                case "ch":
                case "cc":
                case "ca":
                case "cp":
                case "lg":
                case "sh":
                case "wa":
                    _colors[_arg_1] = _arg_2;
                    return;
                default:
                    _SafeStr_14.log((("[FigureData] Unknown partset: " + _arg_1) + ", can not store color-ids"));
                    return;
            };
        }

        public function getFigureStringWithFace(_arg_1:int):String
        {
            var _local_4:int;
            var _local_10:* = null;
            var _local_5:* = null;
            var _local_6:int;
            var _local_7:int;
            var _local_3:Array = [];
            _local_3.push("hd");
            var _local_8:String = "";
            var _local_2:Array = [];
            for each (var _local_9:String in _local_3)
            {
                if (_colors[_local_9] != null)
                {
                    _local_4 = _SafeStr_3740[_local_9];
                    _local_10 = (_colors[_local_9] as Array);
                    if (_local_9 == "hd")
                    {
                        _local_4 = _arg_1;
                    };
                    _local_5 = ((_local_9 + "-") + _local_4);
                    if (_local_4 >= 0)
                    {
                        _local_6 = 0;
                        while (_local_6 < _local_10.length)
                        {
                            _local_5 = (_local_5 + ("-" + _local_10[_local_6]));
                            _local_6++;
                        };
                    };
                    _local_2.push(_local_5);
                };
            };
            _local_7 = 0;
            while (_local_7 < _local_2.length)
            {
                _local_8 = (_local_8 + _local_2[_local_7]);
                if (_local_7 < (_local_2.length - 1))
                {
                    _local_8 = (_local_8 + ".");
                };
                _local_7++;
            };
            return (_local_8);
        }

        public function get gender():String
        {
            return (_SafeStr_3834);
        }


    }
}//package com.sulake.habbo.utils

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_3740 = "_-vf" (String#93, DoABC#4)
// _SafeStr_3834 = "_-tK" (String#1203, DoABC#4)
// _SafeStr_4036 = "_-Mr" (String#290, DoABC#4)
// _SafeStr_5754 = "_-cT" (String#11862, DoABC#4)
// _SafeStr_8288 = "_-aW" (String#24087, DoABC#4)
// _SafeStr_8291 = "_-U1p" (String#28804, DoABC#4)
// _SafeStr_8292 = "_-51D" (String#28777, DoABC#4)


