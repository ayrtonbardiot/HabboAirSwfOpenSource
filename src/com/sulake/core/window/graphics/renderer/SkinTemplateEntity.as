// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.window.graphics.renderer.SkinTemplateEntity

package com.sulake.core.window.graphics.renderer
{
    import flash.geom.Rectangle;

    public class SkinTemplateEntity implements ISkinTemplateEntity 
    {

        protected var _SafeStr_3820:uint;
        protected var _name:String;
        protected var _SafeStr_4028:String;
        protected var _SafeStr_6389:Rectangle;

        public function SkinTemplateEntity(_arg_1:String, _arg_2:String, _arg_3:uint, _arg_4:Rectangle)
        {
            _SafeStr_3820 = _arg_3;
            _name = _arg_1;
            _SafeStr_4028 = _arg_2;
            _SafeStr_6389 = _arg_4;
        }

        public function get id():uint
        {
            return (_SafeStr_3820);
        }

        public function get name():String
        {
            return (_name);
        }

        public function get type():String
        {
            return (_SafeStr_4028);
        }

        public function get region():Rectangle
        {
            return (_SafeStr_6389);
        }


    }
}//package com.sulake.core.window.graphics.renderer

// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_4028 = "_-81R" (String#336, DoABC#4)
// _SafeStr_6389 = "_-C1U" (String#2446, DoABC#4)


