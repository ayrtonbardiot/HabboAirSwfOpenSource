// by nota

//com.sulake.habbo.ui.widget.avatarinfo.botskills.BotChangeNameConfiguration

package com.sulake.habbo.ui.widget.avatarinfo.botskills
{
    import com.sulake.habbo.ui.widget.avatarinfo.AvatarInfoWidget;
    import flash.geom.Point;
    import com.sulake.core.window.components.ITextWindow;
    import _-T1V._SafeStr_849;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class BotChangeNameConfiguration extends BotSkillConfigurationViewBase 
    {

        private var _newName:String = "";

        public function BotChangeNameConfiguration(_arg_1:AvatarInfoWidget)
        {
            super(_arg_1);
        }

        override protected function get windowAssetName():String
        {
            return ("name_configuration_xml");
        }

        override protected function get skillType():int
        {
            return (5);
        }

        override public function dispose():void
        {
            close();
            super.dispose();
        }

        override public function open(_arg_1:int, _arg_2:Point=null):void
        {
            super.open(_arg_1, _arg_2);
            _window.procedure = procedure;
        }

        override public function parseConfiguration(_arg_1:String):void
        {
            nameInput = _arg_1;
        }

        private function set nameInput(_arg_1:String):void
        {
            _newName = _arg_1;
            var _local_2:ITextWindow = ITextWindow(_window.findChildByName("name_input"));
            _local_2.text = _newName;
            _local_2.activate();
        }

        override protected function deactivateInputs():void
        {
            _window.findChildByName("name_input").deactivate();
        }

        private function procedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                switch (_arg_2.name)
                {
                    case "save_button":
                        _SafeStr_4981.handler.container.connection.send(new _SafeStr_849(_SafeStr_5666, 5, _newName));
                        close();
                        break;
                    case "cancel_button":
                        close();
                };
            };
            if (_arg_1.type == "WKE_KEY_UP")
            {
                _newName = ITextWindow(_window.findChildByName("name_input")).text;
            };
        }


    }
}//package com.sulake.habbo.ui.widget.avatarinfo.botskills

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_5666 = "_-32J" (String#3660, DoABC#4)
// _SafeStr_849 = "_-E1I" (String#4167, DoABC#4)


