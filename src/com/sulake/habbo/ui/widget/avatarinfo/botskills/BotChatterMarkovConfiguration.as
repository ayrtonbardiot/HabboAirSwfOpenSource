// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.avatarinfo.botskills.BotChatterMarkovConfiguration

package com.sulake.habbo.ui.widget.avatarinfo.botskills
{
    import com.sulake.habbo.ui.widget.avatarinfo.AvatarInfoWidget;
    import flash.geom.Point;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components._SafeStr_3158;
    import _-T1V._SafeStr_849;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class BotChatterMarkovConfiguration extends BotSkillConfigurationViewBase 
    {

        public function BotChatterMarkovConfiguration(_arg_1:AvatarInfoWidget)
        {
            super(_arg_1);
        }

        private static function sanitizeBotChatString(_arg_1:String):String
        {
            var _local_2:* = _arg_1;
            return (_local_2.replace(/;#;/g, " "));
        }


        override protected function get windowAssetName():String
        {
            return ("chatter_configuration_xml");
        }

        override protected function get skillType():int
        {
            return (2);
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
            var _local_2:* = null;
            if (_arg_1.indexOf(";#;") == -1)
            {
                _local_2 = _arg_1.split(";");
            }
            else
            {
                _local_2 = _arg_1.split(";#;");
            };
            if (((_local_2.length == 3) && (_window)))
            {
                text = _local_2[0];
                autoChat = ((_local_2[1].toLowerCase() == "true") || (_local_2[1] == "1"));
                chatDelay = _local_2[2];
                markovEnabled = false;
            }
            else
            {
                if (((_local_2.length == 4) && (_window)))
                {
                    text = _local_2[0];
                    autoChat = ((_local_2[1].toLowerCase() == "true") || (_local_2[1] == "1"));
                    chatDelay = _local_2[2];
                    markovEnabled = ((_local_2[3].toLowerCase() == "true") || (_local_2[3] == "1"));
                };
            };
        }

        override protected function deactivateInputs():void
        {
            _window.findChildByName("chat_text").deactivate();
            _window.findChildByName("auto_chat_checkbox").deactivate();
            _window.findChildByName("markov_checkbox").deactivate();
            _window.findChildByName("chat_delay_text").deactivate();
        }

        private function set text(_arg_1:String):void
        {
            var _local_2:ITextWindow = ITextWindow(_window.findChildByName("chat_text"));
            _local_2.text = _arg_1;
            _local_2.activate();
        }

        private function get text():String
        {
            return (ITextWindow(_window.findChildByName("chat_text")).text);
        }

        private function set autoChat(_arg_1:Boolean):void
        {
            var _local_2:_SafeStr_3158 = _SafeStr_3158(_window.findChildByName("auto_chat_checkbox"));
            _local_2.isSelected = _arg_1;
            _local_2.activate();
        }

        private function get autoChat():Boolean
        {
            return (_SafeStr_3158(_window.findChildByName("auto_chat_checkbox")).isSelected);
        }

        private function set markovEnabled(_arg_1:Boolean):void
        {
            var _local_2:_SafeStr_3158 = _SafeStr_3158(_window.findChildByName("markov_checkbox"));
            _local_2.isSelected = _arg_1;
            _local_2.activate();
        }

        private function get markovEnabled():Boolean
        {
            return (_SafeStr_3158(_window.findChildByName("markov_checkbox")).isSelected);
        }

        private function set chatDelay(_arg_1:int):void
        {
            var _local_2:ITextWindow = ITextWindow(_window.findChildByName("chat_delay_text"));
            _local_2.text = _arg_1.toString();
            _local_2.activate();
        }

        private function get chatDelay():int
        {
            return (ITextWindow(_window.findChildByName("chat_delay_text")).text);
        }

        private function get botCommandString():String
        {
            return ((((((sanitizeBotChatString(text) + ";#;") + autoChat) + ";#;") + chatDelay) + ";#;") + markovEnabled);
        }

        private function procedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                switch (_arg_2.name)
                {
                    case "save_button":
                        _SafeStr_4981.handler.container.connection.send(new _SafeStr_849(_SafeStr_5666, 2, botCommandString));
                        close();
                        return;
                    case "cancel_button":
                        close();
                        return;
                    case "help_link":
                        HabboWebTools.navigateToURL(_SafeStr_4981.configuration.getProperty("link.format.bots.help"), "habboMain");
                        return;
                };
            };
        }


    }
}//package com.sulake.habbo.ui.widget.avatarinfo.botskills

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3158 = "_-RF" (String#812, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_5666 = "_-32J" (String#3660, DoABC#4)
// _SafeStr_849 = "_-E1I" (String#4167, DoABC#4)


