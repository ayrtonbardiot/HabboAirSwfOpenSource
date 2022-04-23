// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.freeflowchat.viewer.simulation.ChatBubbleSimulationWithLimitedWideRect

package com.sulake.habbo.freeflowchat.viewer.simulation
{
    import flash.geom.Rectangle;
    import com.sulake.habbo.freeflowchat.viewer.visualization.PooledChatBubble;

    public class ChatBubbleSimulationWithLimitedWideRect extends ChatBubbleSimulationEntity 
    {

        public static const WIDERECT_WIDTH:int = 240;

        private var _wideRectOffset:Number;

        public function ChatBubbleSimulationWithLimitedWideRect(_arg_1:PooledChatBubble)
        {
            super(_arg_1, false);
            _SafeStr_5845 = new Rectangle();
            _SafeStr_5845.width = 240;
            _SafeStr_5845.height = (_SafeStr_5844.height / 2);
            _wideRectOffset = (-(240 - _SafeStr_5844.width) / 2);
            _SafeStr_5845.x = (_SafeStr_5844.x + _wideRectOffset);
            _SafeStr_5845.y = _SafeStr_5844.y;
        }

        override public function set x(_arg_1:Number):void
        {
            _SafeStr_4050 = (_SafeStr_4050 + ((_arg_1 - _SafeStr_4050) * (1 - 0.1)));
            _SafeStr_5844.x = _SafeStr_4050;
            if (_SafeStr_5845)
            {
                _SafeStr_5845.x = (_SafeStr_5844.x + _wideRectOffset);
            };
        }

        override public function initializePosition(_arg_1:Number, _arg_2:Number):void
        {
            var _local_3:Rectangle = _visualization.overlap;
            _SafeStr_4050 = (_arg_1 + ((_local_3) ? _local_3.x : 0));
            _SafeStr_4051 = (_arg_2 + ((_local_3) ? _local_3.y : 0));
            _SafeStr_5844.x = _SafeStr_4050;
            _SafeStr_5844.y = _SafeStr_4051;
            if (_SafeStr_5845)
            {
                _SafeStr_5845.x = (_SafeStr_5844.x + _wideRectOffset);
                _SafeStr_5845.y = _SafeStr_5844.y;
            };
        }

        public function get wideRectOffset():Number
        {
            return (_wideRectOffset);
        }

        public function set wideRectOffset(_arg_1:Number):void
        {
            _wideRectOffset = _arg_1;
        }


    }
}//package com.sulake.habbo.freeflowchat.viewer.simulation

// _SafeStr_4050 = "_-22N" (String#402, DoABC#4)
// _SafeStr_4051 = "_-1L" (String#429, DoABC#4)
// _SafeStr_5844 = "_-YL" (String#1981, DoABC#4)
// _SafeStr_5845 = "_-b1z" (String#2405, DoABC#4)


