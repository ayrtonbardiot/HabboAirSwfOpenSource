// by nota

//com.sulake.core.window.theme.PropertyMap

package com.sulake.core.window.theme
{
    import flash.utils.Dictionary;
    import com.sulake.core.window.utils.PropertyStruct;
    import com.sulake.core.window.utils.*;

    public class PropertyMap implements _SafeStr_3283 
    {

        private var _SafeStr_5400:Dictionary = new Dictionary();


        private function add(_arg_1:String, _arg_2:Object, _arg_3:String, _arg_4:Array=null):void
        {
            _SafeStr_5400[_arg_1] = new PropertyStruct(_arg_1, _arg_2, _arg_3, false, _arg_4);
        }

        public function addBoolean(_arg_1:String, _arg_2:Boolean):void
        {
            add(_arg_1, _arg_2, "Boolean");
        }

        public function addInt(_arg_1:String, _arg_2:int):void
        {
            add(_arg_1, _arg_2, "int");
        }

        public function addUint(_arg_1:String, _arg_2:uint):void
        {
            add(_arg_1, _arg_2, "uint");
        }

        public function addHex(_arg_1:String, _arg_2:uint):void
        {
            add(_arg_1, _arg_2, "hex");
        }

        public function addNumber(_arg_1:String, _arg_2:Number):void
        {
            add(_arg_1, _arg_2, "Number");
        }

        public function addString(_arg_1:String, _arg_2:String):void
        {
            add(_arg_1, _arg_2, "String");
        }

        public function addEnumeration(_arg_1:String, _arg_2:String, _arg_3:Array):void
        {
            add(_arg_1, _arg_2, "String", _arg_3);
        }

        public function addArray(_arg_1:String, _arg_2:Array):void
        {
            add(_arg_1, _arg_2, "Array");
        }

        public function get(_arg_1:String):PropertyStruct
        {
            return (_SafeStr_5400[_arg_1]);
        }

        public function clone():PropertyMap
        {
            var _local_1:PropertyMap = new PropertyMap();
            for (var _local_2:String in _SafeStr_5400)
            {
                _local_1._SafeStr_5400[_local_2] = _SafeStr_5400[_local_2];
            };
            return (_local_1);
        }


    }
}//package com.sulake.core.window.theme

// _SafeStr_3283 = "_-EE" (String#9283, DoABC#4)
// _SafeStr_5400 = "_-f1t" (String#4893, DoABC#4)


