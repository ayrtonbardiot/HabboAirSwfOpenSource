// by nota

//com.sulake.habbo.ui.widget.enums.AvatarExpressionEnum

package com.sulake.habbo.ui.widget.enums
{
    public class AvatarExpressionEnum 
    {

        public static const _SafeStr_4205:AvatarExpressionEnum = new AvatarExpressionEnum(0);
        public static const WAVE:AvatarExpressionEnum = new AvatarExpressionEnum(1);
        public static const BLOW:AvatarExpressionEnum = new AvatarExpressionEnum(2);
        public static const LAUGH:AvatarExpressionEnum = new AvatarExpressionEnum(3);
        public static const CRY:AvatarExpressionEnum = new AvatarExpressionEnum(4);
        public static const _SafeStr_3943:AvatarExpressionEnum = new AvatarExpressionEnum(5);
        public static const JUMP:AvatarExpressionEnum = new AvatarExpressionEnum(6);
        public static const RESPECT:AvatarExpressionEnum = new AvatarExpressionEnum(7);

        private var _SafeStr_4206:int = 0;

        public function AvatarExpressionEnum(_arg_1:int):void
        {
            _SafeStr_4206 = _arg_1;
        }

        public function get ordinal():int
        {
            return (_SafeStr_4206);
        }

        public function equals(_arg_1:AvatarExpressionEnum):Boolean
        {
            return ((_arg_1) && (_arg_1._SafeStr_4206 == _SafeStr_4206));
        }


    }
}//package com.sulake.habbo.ui.widget.enums

// _SafeStr_3943 = "_-i1k" (String#11339, DoABC#4)
// _SafeStr_4205 = "_-51E" (String#7514, DoABC#4)
// _SafeStr_4206 = "_-X15" (String#11840, DoABC#4)


