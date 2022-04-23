// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.freeflowchat.viewer.simulation.ChatBubbleSimulationEntity

package com.sulake.habbo.freeflowchat.viewer.simulation
{
    import com.sulake.habbo.freeflowchat.viewer.visualization.PooledChatBubble;
    import flash.geom.Rectangle;
    import __AS3__.vec.Vector;

    public class ChatBubbleSimulationEntity 
    {

        public static const VISUALIZATION_OVERLAP_VERTICAL:int = 10;

        protected const MOVE_NEGATIVE_FEEDBACK:Number = 0.1;
        private const _SafeStr_8538:int = 2500;

        protected var _visualization:PooledChatBubble;
        protected var _SafeStr_4050:Number;
        protected var _SafeStr_4051:Number;
        protected var _SafeStr_5844:Rectangle = new Rectangle();
        protected var _SafeStr_5845:Rectangle = null;
        protected var _SafeStr_5846:Number;
        protected var _SafeStr_5848:Number;
        private var _SafeStr_5847:Vector.<ChatBubbleSimulationEntity> = new Vector.<ChatBubbleSimulationEntity>(0);
        private var _SafeStr_5849:Boolean = false;

        public function ChatBubbleSimulationEntity(_arg_1:PooledChatBubble, _arg_2:Boolean=false)
        {
            _visualization = _arg_1;
            var _local_3:Rectangle = _arg_1.overlap;
            _SafeStr_4050 = (_arg_1.x + ((_local_3) ? _local_3.x : 0));
            _SafeStr_4051 = (_arg_1.y + ((_local_3) ? _local_3.y : 0));
            _SafeStr_5844.x = _SafeStr_4050;
            _SafeStr_5844.y = _SafeStr_4051;
            _SafeStr_5844.width = (_visualization.width - ((_local_3) ? (_local_3.x + _local_3.width) : 0));
            _SafeStr_5844.height = ((_visualization.displayedHeight - 10) - ((_local_3) ? (_local_3.y + _local_3.height) : 0));
            if (_visualization.minHeight != -1)
            {
                _SafeStr_5844.height = _visualization.minHeight;
            };
            if (_arg_2)
            {
                _SafeStr_5845 = new Rectangle();
                _SafeStr_5845.width = (_SafeStr_5844.width + (2 * 2500));
                _SafeStr_5845.height = ((_visualization.minHeight != -1) ? _visualization.minHeight : (_SafeStr_5844.height / 2));
                _SafeStr_5845.x = (_SafeStr_5844.x - 2500);
                _SafeStr_5845.y = _SafeStr_5844.y;
            };
        }

        public function dispose():void
        {
            if (_visualization)
            {
                _visualization.readyToRecycle = true;
            };
            _visualization = null;
            _SafeStr_5844 = null;
            _SafeStr_5847 = null;
            _SafeStr_5845 = null;
        }

        public function get y():Number
        {
            return (_SafeStr_4051);
        }

        public function set y(_arg_1:Number):void
        {
            _SafeStr_4051 = _arg_1;
            _SafeStr_5844.y = _SafeStr_4051;
            if (_SafeStr_5845)
            {
                _SafeStr_5845.y = _SafeStr_5844.y;
            };
        }

        public function get x():Number
        {
            return (_SafeStr_4050);
        }

        public function set x(_arg_1:Number):void
        {
            _SafeStr_4050 = (_SafeStr_4050 + ((_arg_1 - _SafeStr_4050) * (1 - 0.1)));
            _SafeStr_5844.x = _SafeStr_4050;
            if (_SafeStr_5845)
            {
                _SafeStr_5845.x = (_SafeStr_5844.x - 2500);
            };
        }

        public function get visualRect():Rectangle
        {
            return (_SafeStr_5844);
        }

        public function get wideRect():Rectangle
        {
            return ((_SafeStr_5845) ? _SafeStr_5845 : _SafeStr_5844);
        }

        public function get hasWideRect():Boolean
        {
            return (!(_SafeStr_5845 == null));
        }

        public function get centerX():Number
        {
            return (_SafeStr_4050 + (_SafeStr_5844.width / 2));
        }

        public function initializePosition(_arg_1:Number, _arg_2:Number):void
        {
            var _local_3:Rectangle = _visualization.overlap;
            _SafeStr_4050 = (_arg_1 + ((_local_3) ? _local_3.x : 0));
            _SafeStr_4051 = (_arg_2 + ((_local_3) ? _local_3.y : 0));
            _SafeStr_5844.x = _SafeStr_4050;
            _SafeStr_5844.y = _SafeStr_4051;
            if (_SafeStr_5845)
            {
                _SafeStr_5845.x = (_SafeStr_5844.x - 2500);
                _SafeStr_5845.y = _SafeStr_5844.y;
            };
        }

        public function addHorizontalImpulse(_arg_1:Number):void
        {
            _SafeStr_5846 = (_SafeStr_5846 + _arg_1);
        }

        public function addCollisionHandled(_arg_1:ChatBubbleSimulationEntity):void
        {
            _SafeStr_5847.push(_arg_1);
        }

        public function hasCollidedWith(_arg_1:ChatBubbleSimulationEntity):Boolean
        {
            return (!(_SafeStr_5847.indexOf(_arg_1) == -1));
        }

        public function addVerticalImpulse(_arg_1:Number):void
        {
            _SafeStr_5848 = (_SafeStr_5848 + _arg_1);
        }

        public function applyImpulseForces(_arg_1:int):void
        {
            x = (x + _SafeStr_5846);
            y = (y + Math.max(_SafeStr_5848, -(_arg_1)));
        }

        public function resetSimulationStep():void
        {
            _SafeStr_5846 = 0;
            _SafeStr_5848 = 0;
            _SafeStr_5847 = new Vector.<ChatBubbleSimulationEntity>(0);
        }

        public function syncToVisualization(_arg_1:Boolean=false):void
        {
            var _local_2:Rectangle = _visualization.overlap;
            if (!_arg_1)
            {
                _visualization.moveTo((_SafeStr_4050 - ((_local_2) ? _local_2.x : 0)), (_SafeStr_4051 - ((_local_2) ? _local_2.y : 0)));
            }
            else
            {
                _visualization.warpTo((_SafeStr_4050 - ((_local_2) ? _local_2.x : 0)), (_SafeStr_4051 - ((_local_2) ? _local_2.y : 0)));
            };
        }

        public function set fullHeightCollision(_arg_1:Boolean):void
        {
            if (_SafeStr_5845)
            {
                _SafeStr_5845.height = ((_arg_1) ? _SafeStr_5844.height : (_SafeStr_5844.height / 2));
            };
        }

        public function get visualizationHasHitMargin():Boolean
        {
            return (_visualization.hasHitDesktopMargin);
        }

        public function set readyToRecycle(_arg_1:Boolean):void
        {
            _visualization.readyToRecycle = _arg_1;
        }

        public function get readyToRecycle():Boolean
        {
            return (_visualization.readyToRecycle);
        }

        public function get timeStamp():uint
        {
            return (_visualization.timeStamp);
        }

        public function get isSpacer():Boolean
        {
            return (_SafeStr_5849);
        }

        public function set isSpacer(_arg_1:Boolean):void
        {
            _SafeStr_5849 = _arg_1;
        }

        public function intersectsWith(_arg_1:ChatBubbleSimulationEntity):Boolean
        {
            if (_SafeStr_5845)
            {
                return ((_SafeStr_5844.intersects(_arg_1._SafeStr_5844)) || (_SafeStr_5845.intersects(_arg_1.wideRect)));
            };
            if (_arg_1._SafeStr_5845)
            {
                return ((_SafeStr_5844.intersects(_arg_1._SafeStr_5844)) || (_SafeStr_5844.intersects(_arg_1._SafeStr_5845)));
            };
            return (_SafeStr_5844.intersects(_arg_1._SafeStr_5844));
        }

        public function visualIntertersectsWith(_arg_1:ChatBubbleSimulationEntity):Boolean
        {
            return (_SafeStr_5844.intersects(_arg_1._SafeStr_5844));
        }


    }
}//package com.sulake.habbo.freeflowchat.viewer.simulation

// _SafeStr_4050 = "_-22N" (String#402, DoABC#4)
// _SafeStr_4051 = "_-1L" (String#429, DoABC#4)
// _SafeStr_5844 = "_-YL" (String#1981, DoABC#4)
// _SafeStr_5845 = "_-b1z" (String#2405, DoABC#4)
// _SafeStr_5846 = "_-s1c" (String#11213, DoABC#4)
// _SafeStr_5847 = "_-e1u" (String#8127, DoABC#4)
// _SafeStr_5848 = "_-31z" (String#10706, DoABC#4)
// _SafeStr_5849 = "_-N1P" (String#21347, DoABC#4)
// _SafeStr_8538 = "_-J5" (String#39806, DoABC#4)


