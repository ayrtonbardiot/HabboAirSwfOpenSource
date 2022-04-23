// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.window.theme.Theme

package com.sulake.habbo.window.theme
{
    import com.sulake.core.window.theme.PropertyMap;

    public class Theme 
    {

        public static const _SafeStr_4205:String = "None";
        public static const ICON:String = "Icon";
        public static const LEGACY_BORDER:String = "Legacy border";
        public static const VOLTER:String = "Volter";
        public static const UBUNTU:String = "Ubuntu";
        public static const ILLUMINA_LIGHT:String = "Illumina Light";
        public static const ILLUMINA_DARK:String = "Illumina Dark";

        private var _name:String;
        private var _SafeStr_5678:Boolean;
        private var _SafeStr_5679:uint;
        private var _SafeStr_5680:uint;
        private var _SafeStr_4447:PropertyMap;

        public function Theme(_arg_1:String, _arg_2:Boolean, _arg_3:uint, _arg_4:uint, _arg_5:PropertyMap)
        {
            _name = _arg_1;
            _SafeStr_5678 = _arg_2;
            _SafeStr_5679 = _arg_3;
            _SafeStr_5680 = _arg_4;
            _SafeStr_4447 = _arg_5;
        }

        public function get name():String
        {
            return (_name);
        }

        public function get isReal():Boolean
        {
            return (_SafeStr_5678);
        }

        public function get baseStyle():uint
        {
            return (_SafeStr_5679);
        }

        public function get styleCount():uint
        {
            return (_SafeStr_5680);
        }

        public function get propertyDefaults():PropertyMap
        {
            return (_SafeStr_4447);
        }

        public function coversStyle(_arg_1:uint):Boolean
        {
            return ((_arg_1 >= _SafeStr_5679) && (_arg_1 < (_SafeStr_5679 + _SafeStr_5680)));
        }


    }
}//package com.sulake.habbo.window.theme

// _SafeStr_4205 = "_-51E" (String#7514, DoABC#4)
// _SafeStr_4447 = "_-O1c" (String#6794, DoABC#4)
// _SafeStr_5678 = "_-Hy" (String#18851, DoABC#4)
// _SafeStr_5679 = "_-o18" (String#11611, DoABC#4)
// _SafeStr_5680 = "_-zl" (String#15536, DoABC#4)


