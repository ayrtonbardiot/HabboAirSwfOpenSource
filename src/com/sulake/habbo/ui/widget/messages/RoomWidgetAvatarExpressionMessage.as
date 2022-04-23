// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.messages.RoomWidgetAvatarExpressionMessage

package com.sulake.habbo.ui.widget.messages
{
    import com.sulake.habbo.ui.widget.enums.AvatarExpressionEnum;

    public class RoomWidgetAvatarExpressionMessage extends RoomWidgetMessage 
    {

        public static const _SafeStr_9045:String = "RWCM_MESSAGE_AVATAR_EXPRESSION";

        private var _animation:AvatarExpressionEnum;

        public function RoomWidgetAvatarExpressionMessage(_arg_1:AvatarExpressionEnum)
        {
            super("RWCM_MESSAGE_AVATAR_EXPRESSION");
            _animation = _arg_1;
        }

        public function get animation():AvatarExpressionEnum
        {
            return (_animation);
        }


    }
}//package com.sulake.habbo.ui.widget.messages

// _SafeStr_9045 = "_-Ve" (String#39411, DoABC#4)


