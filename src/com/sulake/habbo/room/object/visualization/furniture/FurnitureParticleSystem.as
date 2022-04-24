// by nota

//com.sulake.habbo.room.object.visualization.furniture.FurnitureParticleSystem

package com.sulake.habbo.room.object.visualization.furniture
{
    import com.sulake.core.utils._SafeStr_24;
    import flash.display.BitmapData;
    import com.sulake.room.object.visualization.IRoomObjectSprite;
    import flash.geom.ColorTransform;
    import flash.geom.Matrix;
    import flash.geom.Point;
    import flash.geom.Rectangle;
    import flash.geom.Vector3D;

    public class FurnitureParticleSystem 
    {

        private var _emitters:_SafeStr_24;
        private var _visualization:AnimatedFurnitureVisualization;
        private var _SafeStr_5914:int;
        private var _SafeStr_5520:int;
        private var _offsetY:int;
        private var _SafeStr_5907:FurnitureParticleSystemEmitter;
        private var _SafeStr_5234:BitmapData;
        private var _SafeStr_5908:IRoomObjectSprite;
        private var _SafeStr_5910:Boolean = false;
        private var _SafeStr_3991:int = 0;
        private var _SafeStr_3992:int = 0;
        private var _SafeStr_5909:Number = 1;
        private var _SafeStr_5906:BitmapData;
        private var _SafeStr_5905:ColorTransform;
        private var _SafeStr_5913:ColorTransform;
        private var _SafeStr_5911:Matrix;
        private var _SafeStr_5912:Matrix;
        private var _SafeStr_4427:Number = 1;
        private var _bgColor:uint = 0xFF000000;

        public function FurnitureParticleSystem(_arg_1:AnimatedFurnitureVisualization)
        {
            _emitters = new _SafeStr_24();
            _visualization = _arg_1;
            _SafeStr_5905 = new ColorTransform();
            _SafeStr_5905.alphaMultiplier = 1;
            _SafeStr_5913 = new ColorTransform();
            _SafeStr_5911 = new Matrix();
            _SafeStr_5912 = new Matrix();
        }

        public function dispose():void
        {
            for each (var _local_1:FurnitureParticleSystemEmitter in _emitters)
            {
                _local_1.dispose();
            };
            _emitters = null;
            if (_SafeStr_5234)
            {
                _SafeStr_5234.dispose();
                _SafeStr_5234 = null;
            };
            if (_SafeStr_5906)
            {
                _SafeStr_5906.dispose();
                _SafeStr_5906 = null;
            };
            _SafeStr_5905 = null;
            _SafeStr_5913 = null;
            _SafeStr_5911 = null;
            _SafeStr_5912 = null;
        }

        public function reset():void
        {
            if (_SafeStr_5907)
            {
                _SafeStr_5907.reset();
            };
            _SafeStr_5907 = null;
            _SafeStr_5910 = false;
            updateCanvas();
        }

        public function setAnimation(_arg_1:int):void
        {
            if (_SafeStr_5907)
            {
                _SafeStr_5907.reset();
            };
            _SafeStr_5907 = _emitters[_arg_1];
            _SafeStr_5910 = false;
            updateCanvas();
        }

        private function updateCanvas():void
        {
            if (!_SafeStr_5907)
            {
                return;
            };
            if (_SafeStr_5520 >= 0)
            {
                _SafeStr_5908 = _visualization.getSprite(_SafeStr_5520);
                if (((_SafeStr_5908) && (_SafeStr_5908.asset)))
                {
                    if (((_SafeStr_5908.width <= 1) || (_SafeStr_5908.height <= 1)))
                    {
                        return;
                    };
                    if (((_SafeStr_5234) && ((!(_SafeStr_5234.width == _SafeStr_5908.width)) || (!(_SafeStr_5234.height == _SafeStr_5908.height)))))
                    {
                        _SafeStr_5234 = null;
                    };
                    if (_SafeStr_5234 == null)
                    {
                        _SafeStr_5234 = _SafeStr_5908.asset.clone();
                        if (_SafeStr_5905.alphaMultiplier != 1)
                        {
                            _SafeStr_5906 = new BitmapData(_SafeStr_5234.width, _SafeStr_5234.height, true, _bgColor);
                        };
                    };
                    _SafeStr_3991 = -(_SafeStr_5908.offsetX);
                    _SafeStr_3992 = -(_SafeStr_5908.offsetY);
                    _SafeStr_5908.asset = _SafeStr_5234;
                };
                if (_SafeStr_5234)
                {
                    _SafeStr_5234.fillRect(_SafeStr_5234.rect, _bgColor);
                };
                if (_SafeStr_5906)
                {
                    _SafeStr_5906.fillRect(_SafeStr_5906.rect, _bgColor);
                };
            };
        }

        public function getSpriteYOffset(_arg_1:int, _arg_2:int, _arg_3:int):int
        {
            if (((_SafeStr_5907) && (_SafeStr_5907.roomObjectSpriteId == _arg_3)))
            {
                return (_SafeStr_5907.y * _SafeStr_5909);
            };
            return (0);
        }

        public function controlsSprite(_arg_1:int):Boolean
        {
            if (_SafeStr_5907)
            {
                return (_SafeStr_5907.roomObjectSpriteId == _arg_1);
            };
            return (false);
        }

        public function updateSprites():void
        {
            if (((!(_SafeStr_5907)) || (!(_SafeStr_5908))))
            {
                return;
            };
            if (((_SafeStr_5234) && (!(_SafeStr_5908.asset == _SafeStr_5234))))
            {
                _SafeStr_5908.asset = _SafeStr_5234;
                _SafeStr_5908.asset.width;
            };
            if (_SafeStr_5910)
            {
                if (_SafeStr_5907.roomObjectSpriteId >= 0)
                {
                    _visualization.getSprite(_SafeStr_5907.roomObjectSpriteId).visible = false;
                };
            };
        }

        public function updateAnimation():void
        {
            var _local_9:int;
            var _local_10:int;
            var _local_1:* = null;
            var _local_11:* = null;
            var _local_3:* = null;
            var _local_6:* = null;
            var _local_8:* = null;
            if (((!(_SafeStr_5907)) || (!(_SafeStr_5908))))
            {
                return;
            };
            var _local_5:* = 10;
            var _local_4:* = 0;
            var _local_2:int;
            if (((!(_SafeStr_5910)) && (_SafeStr_5907.hasIgnited)))
            {
                _SafeStr_5910 = true;
            };
            _local_2 = (_offsetY * _SafeStr_5909);
            _SafeStr_5907.update();
            if (_SafeStr_5910)
            {
                if (_SafeStr_5907.roomObjectSpriteId >= 0)
                {
                    _visualization.getSprite(_SafeStr_5907.roomObjectSpriteId).visible = false;
                };
                if (!_SafeStr_5234)
                {
                    updateCanvas();
                };
                _SafeStr_5234.lock();
                if (_SafeStr_5905.alphaMultiplier == 1)
                {
                    _SafeStr_5234.fillRect(_SafeStr_5234.rect, _bgColor);
                }
                else
                {
                    _SafeStr_5234.draw(_SafeStr_5906, _SafeStr_5911, _SafeStr_5905, "normal", null, false);
                };
                for each (var _local_7:FurnitureParticleSystemParticle in _SafeStr_5907.particles)
                {
                    _local_4 = _local_7.y;
                    _local_9 = int((_SafeStr_3991 + ((((_local_7.x - _local_7.z) * _local_5) / 10) * _SafeStr_5909)));
                    _local_10 = int(((_SafeStr_3992 - _local_2) + ((((_local_4 + ((_local_7.x + _local_7.z) / 2)) * _local_5) / 10) * _SafeStr_5909)));
                    _local_11 = _local_7.getAsset();
                    if (_local_11)
                    {
                        _local_3 = (_local_11.asset.content as BitmapData);
                        if (((_local_7.fade) && (_local_7.alphaMultiplier < 1)))
                        {
                            _SafeStr_5912.identity();
                            _SafeStr_5912.translate((_local_9 + _local_11.offsetX), (_local_10 + _local_11.offsetY));
                            _SafeStr_5913.alphaMultiplier = _local_7.alphaMultiplier;
                            _SafeStr_5234.draw(_local_3, _SafeStr_5912, _SafeStr_5913, "normal", null, false);
                        }
                        else
                        {
                            _local_8 = new Point((_local_9 + _local_11.offsetX), (_local_10 + _local_11.offsetY));
                            _SafeStr_5234.copyPixels(_local_3, _local_3.rect, _local_8, null, null, true);
                        };
                    }
                    else
                    {
                        _local_1 = new Rectangle((_local_9 - 1), (_local_10 - 1), 2, 2);
                        _SafeStr_5234.fillRect(_local_1, 0xFFFFFFFF);
                    };
                };
                _SafeStr_5234.unlock();
            };
        }

        public function parseData(_arg_1:XML):void
        {
            var _local_7:* = null;
            var _local_9:int;
            var _local_21:* = null;
            var _local_4:int;
            var _local_24:* = null;
            var _local_19:int;
            var _local_14:int;
            var _local_25:int;
            var _local_18:int;
            var _local_22:Number;
            var _local_11:Number;
            var _local_20:Number;
            var _local_3:Number;
            var _local_15:* = null;
            var _local_12:Number;
            var _local_10:int;
            var _local_13:Boolean;
            var _local_5:Boolean;
            var _local_16:* = null;
            var _local_23:* = null;
            _SafeStr_5914 = parseInt(_arg_1.@size);
            _SafeStr_5520 = ((_arg_1.hasOwnProperty("@canvas_id")) ? parseInt(_arg_1.@canvas_id) : -1);
            _offsetY = ((_arg_1.hasOwnProperty("@offset_y")) ? parseInt(_arg_1.@offset_y) : 10);
            _SafeStr_5909 = (_SafeStr_5914 / 64);
            _SafeStr_4427 = ((_arg_1.hasOwnProperty("@blend")) ? Number(_arg_1.@blend) : 1);
            _SafeStr_4427 = Math.min(_SafeStr_4427, 1);
            _SafeStr_5905.alphaMultiplier = _SafeStr_4427;
            var _local_8:String = ((_arg_1.hasOwnProperty("@bgcolor")) ? String(_arg_1.@bgcolor) : "0");
            _bgColor = ((_arg_1.hasOwnProperty("@bgcolor")) ? parseInt(_local_8, 16) : 0xFF000000);
            for each (var _local_6:XML in _arg_1.emitter)
            {
                _local_9 = parseInt(_local_6.@id);
                _local_21 = _local_6.@name;
                _local_4 = parseInt(_local_6.@sprite_id);
                _local_24 = new FurnitureParticleSystemEmitter(_local_21, _local_4);
                _emitters[_local_9] = _local_24;
                _local_19 = parseInt(_local_6.@max_num_particles);
                _local_14 = parseInt(_local_6.@particles_per_frame);
                _local_25 = ((_local_6.hasOwnProperty("@burst_pulse")) ? parseInt(_local_6.@burst_pulse) : 1);
                _local_18 = parseInt(_local_6.@fuse_time);
                _local_22 = Number(_local_6.simulation.@force);
                _local_11 = Number(_local_6.simulation.@direction);
                _local_20 = Number(_local_6.simulation.@gravity);
                _local_3 = Number(_local_6.simulation.@airfriction);
                _local_15 = _local_6.simulation.@shape;
                _local_12 = Number(_local_6.simulation.@energy);
                for each (var _local_17:XML in _local_6.particles.particle)
                {
                    _local_10 = parseInt(_local_17.@lifetime);
                    _local_13 = ((_local_17.@is_emitter == "false") ? false : true);
                    _local_5 = (((_local_17.hasOwnProperty("@fade")) && (_local_17.@fade == "true")) ? true : false);
                    _local_16 = [];
                    for each (var _local_2:XML in _local_17.frame)
                    {
                        _local_23 = _visualization.assetCollection.getAsset(_local_2.@name);
                        _local_16.push(_local_23);
                    };
                    _local_24.configureParticle(_local_10, _local_13, _local_16, _local_5);
                };
                _local_24.setup(_local_19, _local_14, _local_22, new Vector3D(0, _local_11, 0), _local_20, _local_3, _local_15, _local_12, _local_18, _local_25);
            };
        }

        public function copyStateFrom(_arg_1:FurnitureParticleSystem):void
        {
            var _local_2:int;
            if (((_arg_1._emitters) && (_arg_1._SafeStr_5907)))
            {
                _local_2 = _arg_1._emitters.getKey(_arg_1._emitters.getValues().indexOf(_arg_1._SafeStr_5907));
            };
            setAnimation(_local_2);
            if (_SafeStr_5907)
            {
                _SafeStr_5907.copyStateFrom(_arg_1._SafeStr_5907, (_arg_1._SafeStr_5914 / _SafeStr_5914));
            };
            _SafeStr_5234 = null;
        }


    }
}//package com.sulake.habbo.room.object.visualization.furniture

// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3991 = "_-k17" (String#6208, DoABC#4)
// _SafeStr_3992 = "_-pX" (String#6202, DoABC#4)
// _SafeStr_4427 = "_-x1" (String#2030, DoABC#4)
// _SafeStr_5234 = "_-gu" (String#735, DoABC#4)
// _SafeStr_5520 = "_-C13" (String#8616, DoABC#4)
// _SafeStr_5905 = "_-71A" (String#7444, DoABC#4)
// _SafeStr_5906 = "_-XQ" (String#6878, DoABC#4)
// _SafeStr_5907 = "_-012" (String#2855, DoABC#4)
// _SafeStr_5908 = "_-81t" (String#4191, DoABC#4)
// _SafeStr_5909 = "_-32W" (String#10676, DoABC#4)
// _SafeStr_5910 = "_-zz" (String#4016, DoABC#4)
// _SafeStr_5911 = "_-CD" (String#13156, DoABC#4)
// _SafeStr_5912 = "_-AB" (String#9299, DoABC#4)
// _SafeStr_5913 = "_-j15" (String#11253, DoABC#4)
// _SafeStr_5914 = "_-61M" (String#8062, DoABC#4)


