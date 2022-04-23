// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.avatar.AvatarImagePartContainer

package com.sulake.habbo.avatar
{
    import com.sulake.habbo.avatar.structure.figure.IPartColor;
    import com.sulake.habbo.avatar.actions.IActionDefinition;
    import flash.geom.ColorTransform;
    import com.sulake.habbo.avatar.structure.animation.AnimationFrame;

    public class AvatarImagePartContainer 
    {

        private var _SafeStr_5945:String;
        private var _SafeStr_5944:String;
        private var _SafeStr_5948:String;
        private var _SafeStr_4977:String;
        private var _color:IPartColor;
        private var _SafeStr_5670:Array;
        private var _action:IActionDefinition;
        private var _SafeStr_5946:Boolean;
        private var _SafeStr_5949:Boolean;
        private var _SafeStr_5950:ColorTransform;
        private var _SafeStr_5947:int;

        public function AvatarImagePartContainer(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:IPartColor, _arg_5:Array, _arg_6:IActionDefinition, _arg_7:Boolean, _arg_8:int, _arg_9:String="", _arg_10:Boolean=false, _arg_11:Number=1)
        {
            _SafeStr_5945 = _arg_1;
            _SafeStr_5944 = _arg_2;
            _SafeStr_4977 = _arg_3;
            _color = _arg_4;
            _SafeStr_5670 = _arg_5;
            _action = _arg_6;
            _SafeStr_5946 = _arg_7;
            _SafeStr_5947 = _arg_8;
            _SafeStr_5948 = _arg_9;
            _SafeStr_5949 = _arg_10;
            _SafeStr_5950 = new ColorTransform(1, 1, 1, _arg_11);
            if (_SafeStr_5670 == null)
            {
                _SafeStr_14.log("Null frame list");
            };
            if (_SafeStr_5944 == "ey")
            {
                _SafeStr_5946 = false;
            };
        }

        public function getFrameIndex(_arg_1:int):int
        {
            var _local_3:* = null;
            if (((!(_SafeStr_5670)) || (_SafeStr_5670.length == 0)))
            {
                return (0);
            };
            var _local_2:int = (_arg_1 % _SafeStr_5670.length);
            if ((_SafeStr_5670[_local_2] is AnimationFrame))
            {
                _local_3 = _SafeStr_5670[_local_2];
                return (_local_3.number);
            };
            return (_local_2);
        }

        public function getFrameDefinition(_arg_1:int):AnimationFrame
        {
            var _local_2:int = (_arg_1 % _SafeStr_5670.length);
            if (((_SafeStr_5670) && (_SafeStr_5670.length > _local_2)))
            {
                if ((_SafeStr_5670[_local_2] is AnimationFrame))
                {
                    return (_SafeStr_5670[_local_2] as AnimationFrame);
                };
            };
            return (null);
        }

        public function getCacheableKey(_arg_1:int):String
        {
            var _local_3:* = null;
            var _local_2:int = (_arg_1 % _SafeStr_5670.length);
            if (((_SafeStr_5670) && (_SafeStr_5670.length > _local_2)))
            {
                if ((_SafeStr_5670[_local_2] is AnimationFrame))
                {
                    _local_3 = (_SafeStr_5670[_local_2] as AnimationFrame);
                    return ((((partId + ":") + _local_3.assetPartDefinition) + ":") + _local_3.number);
                };
            };
            return ((partId + ":") + _local_2);
        }

        public function get bodyPartId():String
        {
            return (_SafeStr_5945);
        }

        public function get partType():String
        {
            return (_SafeStr_5944);
        }

        public function get partId():String
        {
            return (_SafeStr_4977);
        }

        public function get color():IPartColor
        {
            return (_color);
        }

        public function get action():IActionDefinition
        {
            return (_action);
        }

        public function set isColorable(_arg_1:Boolean):void
        {
            _SafeStr_5946 = _arg_1;
        }

        public function get isColorable():Boolean
        {
            return (_SafeStr_5946);
        }

        public function get paletteMapId():int
        {
            return (_SafeStr_5947);
        }

        public function get flippedPartType():String
        {
            return (_SafeStr_5948);
        }

        public function get isBlendable():Boolean
        {
            return (_SafeStr_5949);
        }

        public function get blendTransform():ColorTransform
        {
            return (_SafeStr_5950);
        }

        public function toString():String
        {
            return ([_SafeStr_5945, _SafeStr_5944, _SafeStr_4977].join(":"));
        }


    }
}//package com.sulake.habbo.avatar

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_4977 = "_-HD" (String#6848, DoABC#4)
// _SafeStr_5670 = "_-kH" (String#1221, DoABC#4)
// _SafeStr_5944 = "_-dJ" (String#12917, DoABC#4)
// _SafeStr_5945 = "_-l1a" (String#14793, DoABC#4)
// _SafeStr_5946 = "_-j6" (String#6316, DoABC#4)
// _SafeStr_5947 = "_-rA" (String#9819, DoABC#4)
// _SafeStr_5948 = "_-yI" (String#18517, DoABC#4)
// _SafeStr_5949 = "_-C1c" (String#17982, DoABC#4)
// _SafeStr_5950 = "_-ht" (String#19088, DoABC#4)


