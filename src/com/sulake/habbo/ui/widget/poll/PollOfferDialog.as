// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.poll.PollOfferDialog

package com.sulake.habbo.ui.widget.poll
{
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetPollMessage;
    import com.sulake.core.window.events._SafeStr_3116;

    public class PollOfferDialog implements _SafeStr_3402 
    {

        public static const _SafeStr_8690:String = "POLL_OFFER_STATE_OK";
        public static const CANCEL:String = "POLL_OFFER_STATE_CANCEL";
        public static const UNKNOWN:String = "POLL_OFFER_STATE_UNKNOWN";

        private var _disposed:Boolean = false;
        private var _window:_SafeStr_3263;
        private var _SafeStr_3734:String = "POLL_OFFER_STATE_UNKNOWN";
        private var _SafeStr_4981:PollWidget;
        private var _SafeStr_3820:int = -1;

        public function PollOfferDialog(_arg_1:int, _arg_2:String, _arg_3:String, _arg_4:PollWidget)
        {
            var _local_9:* = null;
            var _local_5:* = null;
            var _local_7:* = null;
            var _local_6:* = null;
            var _local_8:* = null;
            var _local_12:* = null;
            var _local_10:* = null;
            super();
            _SafeStr_3820 = _arg_1;
            _SafeStr_4981 = _arg_4;
            var _local_11:XmlAsset = (_SafeStr_4981.assets.getAssetByName("poll_offer") as XmlAsset);
            if (_local_11 != null)
            {
                _window = (_SafeStr_4981.windowManager.buildFromXML((_local_11.content as XML)) as _SafeStr_3263);
                if (_window)
                {
                    _window.center();
                    _local_9 = _window.findChildByName("poll_offer_button_ok");
                    if (_local_9 != null)
                    {
                        _local_9.addEventListener("WME_CLICK", onOk);
                    };
                    _local_5 = _window.findChildByName("poll_offer_button_cancel");
                    if (_local_5 != null)
                    {
                        _local_5.addEventListener("WME_CLICK", onCancel);
                    };
                    _local_7 = _window.findChildByName("poll_offer_button_later");
                    if (_local_7 != null)
                    {
                        _local_7.addEventListener("WME_CLICK", onLater);
                    };
                    _local_6 = _window.findChildByName("header_button_close");
                    if (_local_6 != null)
                    {
                        _local_6.addEventListener("WME_CLICK", onClose);
                    };
                    _local_12 = (_window.findChildByName("poll_offer_headline") as ITextWindow);
                    if (_local_12)
                    {
                        _local_12.htmlText = _arg_2;
                        _local_8 = (_window.findChildByName("poll_offer_headline_wrapper") as IItemListWindow);
                        if (_local_8)
                        {
                            _window.height = (_window.height + (_local_8.scrollableRegion.height - _local_8.visibleRegion.height));
                        };
                    };
                    _local_10 = (_window.findChildByName("poll_offer_summary") as ITextWindow);
                    if (_local_10)
                    {
                        _local_10.htmlText = _arg_3;
                        _local_8 = (_window.findChildByName("poll_offer_summary_wrapper") as IItemListWindow);
                        if (_local_8)
                        {
                            _window.height = (_window.height + (_local_8.scrollableRegion.height - _local_8.visibleRegion.height));
                        };
                    };
                };
            };
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get state():String
        {
            return (_SafeStr_3734);
        }

        public function start():void
        {
        }

        public function dispose():void
        {
            if (_disposed)
            {
                return;
            };
            _disposed = true;
            if (_window)
            {
                _window.dispose();
                _window = null;
            };
            _SafeStr_4981 = null;
        }

        private function onOk(_arg_1:_SafeStr_3116):void
        {
            if (_SafeStr_3734 != "POLL_OFFER_STATE_UNKNOWN")
            {
                return;
            };
            _SafeStr_3734 = "POLL_OFFER_STATE_OK";
            _SafeStr_4981.messageListener.processWidgetMessage(new RoomWidgetPollMessage("RWPM_START", _SafeStr_3820));
        }

        private function onCancel(_arg_1:_SafeStr_3116):void
        {
            if (_SafeStr_3734 != "POLL_OFFER_STATE_UNKNOWN")
            {
                return;
            };
            _SafeStr_3734 = "POLL_OFFER_STATE_CANCEL";
            _SafeStr_4981.messageListener.processWidgetMessage(new RoomWidgetPollMessage("RWPM_REJECT", _SafeStr_3820));
            _SafeStr_4981.pollCancelled(_SafeStr_3820);
        }

        private function onLater(_arg_1:_SafeStr_3116):void
        {
            if (_SafeStr_3734 != "POLL_OFFER_STATE_UNKNOWN")
            {
                return;
            };
            _SafeStr_3734 = "POLL_OFFER_STATE_CANCEL";
            _SafeStr_4981.pollCancelled(_SafeStr_3820);
        }

        private function onClose(_arg_1:_SafeStr_3116):void
        {
            if (_SafeStr_3734 != "POLL_OFFER_STATE_UNKNOWN")
            {
                return;
            };
            _SafeStr_3734 = "POLL_OFFER_STATE_CANCEL";
            _SafeStr_4981.messageListener.processWidgetMessage(new RoomWidgetPollMessage("RWPM_REJECT", _SafeStr_3820));
            _SafeStr_4981.pollCancelled(_SafeStr_3820);
        }


    }
}//package com.sulake.habbo.ui.widget.poll

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_3402 = "_-11X" (String#10813, DoABC#4)
// _SafeStr_3734 = "_-g1U" (String#198, DoABC#4)
// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_8690 = "_-71S" (String#30800, DoABC#4)


