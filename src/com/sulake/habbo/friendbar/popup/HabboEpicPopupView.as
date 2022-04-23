// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendbar.popup.HabboEpicPopupView

package com.sulake.habbo.friendbar.popup
{
    import com.sulake.habbo.friendbar.view.AbstractView;
    import com.sulake.habbo.friendbar._SafeStr_3148;
    import com.sulake.habbo.communication._SafeStr_25;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.runtime._SafeStr_31;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import __AS3__.vec.Vector;
    import _-41O._SafeStr_521;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class HabboEpicPopupView extends AbstractView implements _SafeStr_3148 
    {

        private var _communicationManager:_SafeStr_25;
        private var _activeFrame:_SafeStr_3133;

        public function HabboEpicPopupView(_arg_1:_SafeStr_31, _arg_2:uint, _arg_3:_SafeStr_21)
        {
            super(_arg_1, _arg_2, _arg_3);
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboCommunicationManager(), function (_arg_1:_SafeStr_25):void
            {
                _communicationManager = _arg_1;
            })]));
        }

        override public function dispose():void
        {
            if (_activeFrame != null)
            {
                _activeFrame.dispose();
                _activeFrame = null;
            };
            super.dispose();
        }

        override protected function initComponent():void
        {
            _communicationManager.addHabboConnectionMessageEvent(new _SafeStr_521(onEpicPopupMessageEvent));
        }

        private function onEpicPopupMessageEvent(_arg_1:_SafeStr_521):void
        {
            showPopup(_arg_1.getParser().imageUri);
        }

        public function showPopup(_arg_1:String):void
        {
            if (_activeFrame != null)
            {
                _activeFrame.dispose();
            };
            _activeFrame = (_windowManager.buildFromXML((assets.getAssetByName("epic_popup_frame_xml").content as XML)) as _SafeStr_3133);
            IStaticBitmapWrapperWindow(_activeFrame.findChildByName("content_static_bitmap")).assetUri = _arg_1;
            _activeFrame.procedure = windowProc;
            _activeFrame.center();
        }

        private function windowProc(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (((!(_activeFrame == null)) && (_arg_1.type == "WME_CLICK")))
            {
                switch (_arg_1.target.name)
                {
                    case "close_button":
                    case "header_button_close":
                        _activeFrame.dispose();
                        _activeFrame = null;
                        return;
                };
            };
        }


    }
}//package com.sulake.habbo.friendbar.popup

// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_31 = "_-Ee" (String#1238, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3148 = "_-D1b" (String#19043, DoABC#4)
// _SafeStr_521 = "_-y1U" (String#23566, DoABC#4)


