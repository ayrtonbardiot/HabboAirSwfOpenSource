// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.freeflowchat.viewer.simulation.ChatBubbleCollisionEvent

package com.sulake.habbo.freeflowchat.viewer.simulation
{
    public class ChatBubbleCollisionEvent 
    {

        private var _SafeStr_6484:ChatBubbleSimulationEntity;
        private var _SafeStr_6485:ChatBubbleSimulationEntity;

        public function ChatBubbleCollisionEvent(_arg_1:ChatBubbleSimulationEntity, _arg_2:ChatBubbleSimulationEntity)
        {
            _SafeStr_6484 = _arg_1;
            _SafeStr_6485 = _arg_2;
        }

        public function get first():ChatBubbleSimulationEntity
        {
            return (_SafeStr_6484);
        }

        public function get second():ChatBubbleSimulationEntity
        {
            return (_SafeStr_6485);
        }

        public function get top():ChatBubbleSimulationEntity
        {
            return ((_SafeStr_6484.y < _SafeStr_6485.y) ? _SafeStr_6484 : _SafeStr_6485);
        }

        public function get bottom():ChatBubbleSimulationEntity
        {
            return ((_SafeStr_6484.y >= _SafeStr_6485.y) ? _SafeStr_6484 : _SafeStr_6485);
        }

        public function get left():ChatBubbleSimulationEntity
        {
            return ((_SafeStr_6484.x < _SafeStr_6485.x) ? _SafeStr_6484 : _SafeStr_6485);
        }

        public function get right():ChatBubbleSimulationEntity
        {
            return ((_SafeStr_6484.x >= _SafeStr_6485.x) ? _SafeStr_6484 : _SafeStr_6485);
        }

        public function get areSameY():Boolean
        {
            return (_SafeStr_6484.y == _SafeStr_6485.y);
        }

        public function get older():ChatBubbleSimulationEntity
        {
            return ((_SafeStr_6484.timeStamp < _SafeStr_6485.timeStamp) ? _SafeStr_6484 : _SafeStr_6485);
        }


    }
}//package com.sulake.habbo.freeflowchat.viewer.simulation

// _SafeStr_6484 = "_-I1W" (String#5105, DoABC#4)
// _SafeStr_6485 = "_-i1t" (String#4974, DoABC#4)


