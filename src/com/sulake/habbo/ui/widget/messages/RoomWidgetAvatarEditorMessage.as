// by nota

//com.sulake.habbo.ui.widget.messages.RoomWidgetAvatarEditorMessage

package com.sulake.habbo.ui.widget.messages
{
    import com.sulake.core.window._SafeStr_3133;

    public class RoomWidgetAvatarEditorMessage extends RoomWidgetMessage 
    {

        public static const _SafeStr_9043:String = "RWCM_OPEN_AVATAR_EDITOR";
        public static const WIDGET_MESSAGE_GET_WARDROBE:String = "RWCM_GET_WARDROBE";
        public static const _SafeStr_9044:String = "RWAEM_AVATAR_EDITOR_VIEW_DISPOSED";

        private var _context:_SafeStr_3133;

        public function RoomWidgetAvatarEditorMessage(_arg_1:String, _arg_2:_SafeStr_3133=null)
        {
            super(_arg_1);
            _context = _arg_2;
        }

        public function get context():_SafeStr_3133
        {
            return (_context);
        }


    }
}//package com.sulake.habbo.ui.widget.messages

// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_9043 = "_-31G" (String#32680, DoABC#4)
// _SafeStr_9044 = "_-Kb" (String#39803, DoABC#4)


