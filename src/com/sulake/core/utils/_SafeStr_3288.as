// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.utils._SafeStr_3288

package com.sulake.core.utils
{
    import flash.geom.Point;
    import flash.geom.Rectangle;

    public class _SafeStr_3288 
    {

        public static const _SafeStr_8079:String = "hex";
        public static const INT:String = "int";
        public static const _SafeStr_8080:String = "uint";
        public static const NUMBER:String = "Number";
        public static const FLOAT:String = "float";
        public static const BOOLEAN:String = "Boolean";
        public static const BOOL:String = "bool";
        public static const STRING:String = "String";
        public static const _SafeStr_8081:String = "Point";
        public static const RECTANGLE:String = "Rectangle";
        public static const ARRAY:String = "Array";
        public static const MAP:String = "Map";
        private static const KEY:String = "key";
        private static const TYPE:String = "type";
        private static const VALUE:String = "value";
        private static const TRUE:String = "true";
        private static const _SafeStr_7899:String = "false";
        private static const X:String = "x";
        private static const _SafeStr_8082:String = "y";
        private static const WIDTH:String = "width";
        private static const HEIGHT:String = "height";
        private static const COMMA:String = ",";


        public static function parseVariableList(_arg_1:XMLList, _arg_2:_SafeStr_24, _arg_3:Array=null):uint
        {
            var _local_5:uint;
            var _local_4:uint = _arg_1.length();
            _local_5 = 0;
            while (_local_5 < _local_4)
            {
                _SafeStr_3288.parseVariableToken(_arg_1[_local_5], _arg_2, _arg_3);
                _local_5++;
            };
            return (_local_4);
        }

        private static function parseVariableToken(_arg_1:XML, _arg_2:_SafeStr_24, _arg_3:Array=null):void
        {
            var _local_9:* = null;
            var _local_7:* = null;
            var _local_8:* = null;
            var _local_4:* = null;
            var _local_5:* = null;
            var _local_6:String = "String";
            _local_8 = _arg_1.attribute("key");
            if (_local_8.length() > 0)
            {
                _local_9 = String(_arg_1.attribute("key"));
            }
            else
            {
                _local_9 = _arg_1.child("key")[0];
            };
            _local_8 = _arg_1.attribute("type");
            if (_local_8.length() > 0)
            {
                _local_6 = String(_arg_1.attribute("type"));
            };
            _local_8 = _arg_1.attribute("value");
            if (_local_8.length() > 0)
            {
                _local_7 = String(_arg_1.attribute("value"));
            };
            if (_local_7 != null)
            {
                _arg_2[_local_9] = _SafeStr_3288.castStringToType(_local_7, _local_6);
            }
            else
            {
                _local_4 = _arg_1.child("value")[0];
                if (_local_4 != null)
                {
                    _local_5 = _local_4.child(0)[0];
                    _local_7 = _local_5.children()[0];
                    _local_6 = _local_5.localName();
                    _arg_2[_local_9] = _SafeStr_3288.parseValueType(_local_5, _local_6);
                }
                else
                {
                    if (((_local_6 == "Map") || (_local_6 == "Array")))
                    {
                        _arg_2[_local_9] = _SafeStr_3288.parseValueType(_arg_1, _local_6);
                    };
                };
            };
            if (_arg_3)
            {
                _arg_3.push(_local_6);
            };
        }

        public static function castStringToType(_arg_1:String, _arg_2:String):Object
        {
            switch (_arg_2)
            {
                case "uint":
                    return (uint(_arg_1));
                case "int":
                    return (int(_arg_1));
                case "Number":
                    return (Number(_arg_1));
                case "float":
                    return (Number(_arg_1));
                case "Boolean":
                    return ((_arg_1 == "true") || (int(_arg_1) > 0));
                case "bool":
                    return ((_arg_1 == "true") || (int(_arg_1) > 0));
                case "hex":
                    return (uint(_arg_1));
                case "Array":
                    return (_arg_1.split(","));
                default:
                    return (_arg_1);
            };
            return (null); //dead code
        }

        public static function parseValueType(_arg_1:XML, _arg_2:String):Object
        {
            var _local_5:* = null;
            var _local_6:* = null;
            var _local_3:* = null;
            var _local_7:* = null;
            var _local_4:* = null;
            switch (_arg_2)
            {
                case "String":
                    return (String(_arg_1));
                case "Point":
                    _local_6 = new Point();
                    _local_6.x = _arg_1.attribute("x");
                    _local_6.y = _arg_1.attribute("y");
                    return (_local_6);
                case "Rectangle":
                    _local_3 = new Rectangle();
                    _local_3.x = _arg_1.attribute("x");
                    _local_3.y = _arg_1.attribute("y");
                    _local_3.width = _arg_1.attribute("width");
                    _local_3.height = _arg_1.attribute("height");
                    return (_local_3);
                case "Array":
                    _local_5 = new _SafeStr_24();
                    parseVariableList(_arg_1.children(), _local_5);
                    _local_4 = [];
                    for (_local_7 in _local_5)
                    {
                        _local_4.push(_local_5[_local_7]);
                    };
                    return (_local_4);
                case "Map":
                    _local_5 = new _SafeStr_24();
                    _SafeStr_3288.parseVariableList(_arg_1.children(), _local_5);
                    return (_local_5);
            };
            throw (new Error((('Unable to parse data type "' + _arg_2) + '", unknown type!')));
            return (null); //dead code
        }


    }
}//package com.sulake.core.utils

// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3288 = "_-32u" (String#6754, DoABC#4)
// _SafeStr_7899 = "_-8J" (String#38802, DoABC#4)
// _SafeStr_8079 = "_-i1N" (String#30287, DoABC#4)
// _SafeStr_8080 = "_-w1A" (String#30346, DoABC#4)
// _SafeStr_8081 = "_-eJ" (String#30344, DoABC#4)
// _SafeStr_8082 = "_-n1M" (String#24348, DoABC#4)


