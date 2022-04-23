// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.chooser.ChooserWidgetBase

package com.sulake.habbo.ui.widget.chooser
{
    import com.sulake.habbo.ui.widget.RoomWidgetBase;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetRoomObjectMessage;

    public class ChooserWidgetBase extends RoomWidgetBase 
    {

        public function ChooserWidgetBase(_arg_1:IRoomWidgetHandler, _arg_2:_SafeStr_1695, _arg_3:_SafeStr_21=null, _arg_4:_SafeStr_18=null)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4);
        }

        public function choose(_arg_1:int, _arg_2:int):void
        {
            var _local_3:RoomWidgetRoomObjectMessage = new RoomWidgetRoomObjectMessage("RWROM_SELECT_OBJECT", _arg_1, _arg_2);
            messageListener.processWidgetMessage(_local_3);
        }


    }
}//package com.sulake.habbo.ui.widget.chooser

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)


