// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.visualization.avatar.additions.ExpressionAddition

package com.sulake.habbo.room.object.visualization.avatar.additions
{
    import com.sulake.habbo.room.object.visualization.avatar.AvatarVisualization;
    import com.sulake.room.object.visualization.IRoomObjectSprite;

    public class ExpressionAddition implements IExpressionAddition 
    {

        protected var _SafeStr_3820:int;
        protected var _SafeStr_5586:AvatarVisualization;
        private var _SafeStr_4028:int = -1;

        public function ExpressionAddition(_arg_1:int, _arg_2:int, _arg_3:AvatarVisualization)
        {
            _SafeStr_4028 = _arg_2;
            _SafeStr_3820 = _arg_1;
            _SafeStr_5586 = _arg_3;
        }

        public function get type():int
        {
            return (_SafeStr_4028);
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_5586 == null);
        }

        public function dispose():void
        {
            _SafeStr_5586 = null;
        }

        public function update(_arg_1:IRoomObjectSprite, _arg_2:Number):void
        {
        }

        public function animate(_arg_1:IRoomObjectSprite):Boolean
        {
            return (false);
        }


    }
}//package com.sulake.habbo.room.object.visualization.avatar.additions

// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_4028 = "_-81R" (String#336, DoABC#4)
// _SafeStr_5586 = "_-d1n" (String#1081, DoABC#4)


