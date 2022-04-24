// by nota

//com.sulake.core.window.utils.PropertyStruct

package com.sulake.core.window.utils
{
    import flash.geom.Point;
    import flash.geom.Rectangle;
    import com.sulake.core.utils._SafeStr_24;
    import flash.utils.getQualifiedClassName;

    public class PropertyStruct 
    {

        public static const _SafeStr_8079:String = "hex";
        public static const INT:String = "int";
        public static const _SafeStr_8080:String = "uint";
        public static const NUMBER:String = "Number";
        public static const BOOLEAN:String = "Boolean";
        public static const STRING:String = "String";
        public static const _SafeStr_8081:String = "Point";
        public static const RECTANGLE:String = "Rectangle";
        public static const ARRAY:String = "Array";
        public static const MAP:String = "Map";

        private var _key:String;
        private var _SafeStr_4525:Object;
        private var _SafeStr_4028:String;
        private var _SafeStr_6140:Boolean;
        private var _SafeStr_8255:Boolean;
        private var _SafeStr_6141:Array;

        public function PropertyStruct(_arg_1:String, _arg_2:Object, _arg_3:String, _arg_4:Boolean=false, _arg_5:Array=null)
        {
            _key = _arg_1;
            _SafeStr_4525 = _arg_2;
            _SafeStr_4028 = _arg_3;
            _SafeStr_6140 = _arg_4;
            _SafeStr_8255 = ((((_arg_3 == "Map") || (_arg_3 == "Array")) || (_arg_3 == "Point")) || (_arg_3 == "Rectangle"));
            _SafeStr_6141 = _arg_5;
        }

        public function get key():String
        {
            return (_key);
        }

        public function get value():Object
        {
            return (_SafeStr_4525);
        }

        public function get type():String
        {
            return (_SafeStr_4028);
        }

        public function get valid():Boolean
        {
            return (_SafeStr_6140);
        }

        public function get range():Array
        {
            return (_SafeStr_6141);
        }

        public function withNameSpace(_arg_1:String):PropertyStruct
        {
            return (new PropertyStruct(((_arg_1 + ":") + _key), _SafeStr_4525, _SafeStr_4028, _SafeStr_6140, _SafeStr_6141));
        }

        public function withoutNameSpace():PropertyStruct
        {
            return (new PropertyStruct(_key.replace(/.*:/, ""), _SafeStr_4525, _SafeStr_4028, _SafeStr_6140, _SafeStr_6141));
        }

        public function withValue(_arg_1:Object):PropertyStruct
        {
            var _local_2:* = null;
            var _local_3:* = null;
            var _local_4:int;
            var _local_5:Boolean = true;
            switch (_SafeStr_4028)
            {
                case "uint":
                case "hex":
                    _local_5 = (!(_SafeStr_4525 == uint(_arg_1)));
                    break;
                case "int":
                    _local_5 = (!(_SafeStr_4525 == int(_arg_1)));
                    break;
                case "Number":
                    _local_5 = (!(_SafeStr_4525 == Number(_arg_1)));
                    break;
                case "Boolean":
                    _local_5 = (!(_SafeStr_4525 == _arg_1));
                    break;
                case "String":
                    _local_5 = (!(_SafeStr_4525 == String(_arg_1)));
                    break;
                case "Array":
                    _local_2 = (_SafeStr_4525 as Array);
                    _local_3 = (_arg_1 as Array);
                    if ((((!(_local_2 == null)) && (!(_local_3 == null))) && (_local_2.length == _local_3.length)))
                    {
                        _local_5 = false;
                        _local_4 = 0;
                        while (_local_4 < _local_3.length)
                        {
                            if (_local_2[_local_4] != _local_3[_local_4])
                            {
                                _local_5 = true;
                                break;
                            };
                            _local_4++;
                        };
                    };
            };
            if (_local_5)
            {
                return (new PropertyStruct(_key, _arg_1, type, true, _SafeStr_6141));
            };
            return (this);
        }

        public function toString():String
        {
            switch (_SafeStr_4028)
            {
                case "hex":
                    return ("0x" + _SafeStr_4525.toString(16));
                case "Boolean":
                    return ((_SafeStr_4525 == true) ? "true" : "false");
                case "Point":
                    return (((("Point(" + Point(_SafeStr_4525).x) + ", ") + Point(_SafeStr_4525).y) + ")");
                case "Rectangle":
                    return (((((((("Rectangle(" + Rectangle(_SafeStr_4525).x) + ", ") + Rectangle(_SafeStr_4525).y) + ", ") + Rectangle(_SafeStr_4525).width) + ", ") + Rectangle(_SafeStr_4525).height) + ")");
            };
            return (value);
        }

        public function toXMLString():String
        {
            var _local_4:int;
            var _local_3:* = null;
            var _local_5:* = null;
            var _local_2:* = null;
            var _local_6:* = null;
            var _local_1:* = null;
            switch (_SafeStr_4028)
            {
                case "Map":
                    _local_5 = (_SafeStr_4525 as _SafeStr_24);
                    _local_3 = (((('<var key="' + _key) + '">\r<value>\r<') + _SafeStr_4028) + ">\r");
                    _local_4 = 0;
                    while (_local_4 < _local_5.length)
                    {
                        _local_3 = (_local_3 + (((((('<var key="' + _local_5.getKey(_local_4)) + '" value="') + _local_5.getWithIndex(_local_4)) + '" type="') + getQualifiedClassName(_local_5.getWithIndex(_local_4))) + '" />\r'));
                        _local_4++;
                    };
                    _local_3 = (_local_3 + (("</" + _SafeStr_4028) + ">\r</value>\r</var>"));
                    break;
                case "Array":
                    _local_2 = (_SafeStr_4525 as Array);
                    _local_3 = (((('<var key="' + _key) + '">\r<value>\r<') + _SafeStr_4028) + ">\r");
                    _local_4 = 0;
                    while (_local_4 < _local_2.length)
                    {
                        _local_3 = (_local_3 + (((((('<var key="' + _local_4) + '" value="') + _local_2[_local_4]) + '" type="') + getQualifiedClassName(_local_2[_local_4])) + '" />\r'));
                        _local_4++;
                    };
                    _local_3 = (_local_3 + (("</" + _SafeStr_4028) + ">\r</value>\r</var>"));
                    break;
                case "Point":
                    _local_6 = (_SafeStr_4525 as Point);
                    _local_3 = (((('<var key="' + _key) + '">\r<value>\r<') + _SafeStr_4028) + ">\r");
                    _local_3 = (_local_3 + (((('<var key="x" value="' + _local_6.x) + '" type="') + "int") + '" />\r'));
                    _local_3 = (_local_3 + (((('<var key="y" value="' + _local_6.y) + '" type="') + "int") + '" />\r'));
                    _local_3 = (_local_3 + (("</" + _SafeStr_4028) + ">\r</value>\r</var>"));
                    break;
                case "Rectangle":
                    _local_1 = (_SafeStr_4525 as Rectangle);
                    _local_3 = (((('<var key="' + _key) + '">\r<value>\r<') + _SafeStr_4028) + ">\r");
                    _local_3 = (_local_3 + (((('<var key="x" value="' + _local_1.x) + '" type="') + "int") + '" />\r'));
                    _local_3 = (_local_3 + (((('<var key="y" value="' + _local_1.y) + '" type="') + "int") + '" />\r'));
                    _local_3 = (_local_3 + (((('<var key="width" value="' + _local_1.width) + '" type="') + "int") + '" />\r'));
                    _local_3 = (_local_3 + (((('<var key="height" value="' + _local_1.height) + '" type="') + "int") + '" />\r'));
                    _local_3 = (_local_3 + (("</" + _SafeStr_4028) + ">\r</value>\r</var>"));
                    break;
                case "hex":
                    _local_3 = ((((((('<var key="' + _key) + '" value="') + "0x") + _SafeStr_4525.toString(16)) + '" type="') + _SafeStr_4028) + '" />');
                    break;
                default:
                    _local_3 = (((((('<var key="' + _key) + '" value="') + _SafeStr_4525) + '" type="') + _SafeStr_4028) + '" />');
            };
            return (_local_3);
        }


    }
}//package com.sulake.core.window.utils

// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_4028 = "_-81R" (String#336, DoABC#4)
// _SafeStr_4525 = "_-8S" (String#1037, DoABC#4)
// _SafeStr_6140 = "_-9f" (String#12906, DoABC#4)
// _SafeStr_6141 = "_-MH" (String#11330, DoABC#4)
// _SafeStr_8079 = "_-i1N" (String#30287, DoABC#4)
// _SafeStr_8080 = "_-w1A" (String#30346, DoABC#4)
// _SafeStr_8081 = "_-eJ" (String#30344, DoABC#4)
// _SafeStr_8255 = "_-7T" (String#24664, DoABC#4)


