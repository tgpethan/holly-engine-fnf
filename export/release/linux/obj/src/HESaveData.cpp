// Generated by Haxe 4.1.5
#include <hxcpp.h>

#ifndef INCLUDED_HESaveData
#include <HESaveData.h>
#endif
#ifndef INCLUDED_Main
#include <Main.h>
#endif
#ifndef INCLUDED_flixel_FlxG
#include <flixel/FlxG.h>
#endif
#ifndef INCLUDED_flixel_system_frontEnds_SoundFrontEnd
#include <flixel/system/frontEnds/SoundFrontEnd.h>
#endif
#ifndef INCLUDED_flixel_util_FlxSave
#include <flixel/util/FlxSave.h>
#endif
#ifndef INCLUDED_flixel_util_IFlxDestroyable
#include <flixel/util/IFlxDestroyable.h>
#endif
#ifndef INCLUDED_openfl_Lib
#include <openfl/Lib.h>
#endif
#ifndef INCLUDED_openfl_display_DisplayObject
#include <openfl/display/DisplayObject.h>
#endif
#ifndef INCLUDED_openfl_display_DisplayObjectContainer
#include <openfl/display/DisplayObjectContainer.h>
#endif
#ifndef INCLUDED_openfl_display_IBitmapDrawable
#include <openfl/display/IBitmapDrawable.h>
#endif
#ifndef INCLUDED_openfl_display_InteractiveObject
#include <openfl/display/InteractiveObject.h>
#endif
#ifndef INCLUDED_openfl_display_MovieClip
#include <openfl/display/MovieClip.h>
#endif
#ifndef INCLUDED_openfl_display_Sprite
#include <openfl/display/Sprite.h>
#endif
#ifndef INCLUDED_openfl_events_EventDispatcher
#include <openfl/events/EventDispatcher.h>
#endif
#ifndef INCLUDED_openfl_events_IEventDispatcher
#include <openfl/events/IEventDispatcher.h>
#endif

HX_LOCAL_STACK_FRAME(_hx_pos_16ef8d73321b963c_36_init,"HESaveData","init",0x4113379a,"HESaveData.init","HESaveData.hx",36,0xa64b411a)
HX_LOCAL_STACK_FRAME(_hx_pos_16ef8d73321b963c_9_init,"HESaveData","init",0x4113379a,"HESaveData.init","HESaveData.hx",9,0xa64b411a)

void HESaveData_obj::__construct() { }

Dynamic HESaveData_obj::__CreateEmpty() { return new HESaveData_obj; }

void *HESaveData_obj::_hx_vtable = 0;

Dynamic HESaveData_obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< HESaveData_obj > _hx_result = new HESaveData_obj();
	_hx_result->__construct();
	return _hx_result;
}

bool HESaveData_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x16c5d948;
}

void HESaveData_obj::init(){
            		HX_BEGIN_LOCAL_FUNC_S0(::hx::LocalFunc,_hx_Closure_0) HXARGC(1)
            		void _hx_run(Float vol){
            			HX_STACKFRAME(&_hx_pos_16ef8d73321b963c_36_init)
HXLINE(  37)			::flixel::FlxG_obj::save->data->__SetField(HX_("volume",da,29,53,5f),vol,::hx::paccDynamic);
HXLINE(  38)			::flixel::FlxG_obj::save->flush(null(),null());
            		}
            		HX_END_LOCAL_FUNC1((void))

            	HX_STACKFRAME(&_hx_pos_16ef8d73321b963c_9_init)
HXLINE(  11)		if (::hx::IsNull( ::flixel::FlxG_obj::save->data->__Field(HX_("frameLimiter",bb,bb,7e,2f),::hx::paccDynamic) )) {
HXLINE(  12)			::flixel::FlxG_obj::save->data->__SetField(HX_("frameLimiter",bb,bb,7e,2f),120,::hx::paccDynamic);
            		}
            		else {
HXLINE(  16)			bool _hx_tmp;
HXDLIN(  16)			if (!(::hx::IsLess( ::flixel::FlxG_obj::save->data->__Field(HX_("frameLimiter",bb,bb,7e,2f),::hx::paccDynamic),30 ))) {
HXLINE(  16)				_hx_tmp = ::hx::IsGreater( ::flixel::FlxG_obj::save->data->__Field(HX_("frameLimiter",bb,bb,7e,2f),::hx::paccDynamic),500 );
            			}
            			else {
HXLINE(  16)				_hx_tmp = true;
            			}
HXDLIN(  16)			if (_hx_tmp) {
HXLINE(  17)				::flixel::FlxG_obj::save->data->__SetField(HX_("frameLimiter",bb,bb,7e,2f),120,::hx::paccDynamic);
            			}
            		}
HXLINE(  21)		if (::hx::IsNull( ::flixel::FlxG_obj::save->data->__Field(HX_("showFPS",ec,0a,9a,7b),::hx::paccDynamic) )) {
HXLINE(  22)			::flixel::FlxG_obj::save->data->__SetField(HX_("showFPS",ec,0a,9a,7b),false,::hx::paccDynamic);
            		}
HXLINE(  25)		if (::hx::IsNull( ::flixel::FlxG_obj::save->data->__Field(HX_("volume",da,29,53,5f),::hx::paccDynamic) )) {
HXLINE(  26)			::flixel::FlxG_obj::save->data->__SetField(HX_("volume",da,29,53,5f),((Float)1.0),::hx::paccDynamic);
            		}
HXLINE(  31)		::flixel::FlxG_obj::sound->set_volume(( (Float)(::flixel::FlxG_obj::save->data->__Field(HX_("volume",da,29,53,5f),::hx::paccDynamic)) ));
HXLINE(  32)		::flixel::FlxG_obj::sound->showSoundTray();
HXLINE(  35)		::flixel::FlxG_obj::sound->volumeHandler =  ::Dynamic(new _hx_Closure_0());
HXLINE(  42)		::hx::TCast<  ::Main >::cast(::openfl::Lib_obj::get_current()->getChildAt(0))->setFPSVisibility(( (bool)(::flixel::FlxG_obj::save->data->__Field(HX_("showFPS",ec,0a,9a,7b),::hx::paccDynamic)) ));
HXLINE(  45)		::hx::TCast<  ::Main >::cast(::openfl::Lib_obj::get_current()->getChildAt(0))->setMaxFPS(( (int)(::flixel::FlxG_obj::save->data->__Field(HX_("frameLimiter",bb,bb,7e,2f),::hx::paccDynamic)) ));
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC0(HESaveData_obj,init,(void))


HESaveData_obj::HESaveData_obj()
{
}

bool HESaveData_obj::__GetStatic(const ::String &inName, Dynamic &outValue, ::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"init") ) { outValue = init_dyn(); return true; }
	}
	return false;
}

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo *HESaveData_obj_sMemberStorageInfo = 0;
static ::hx::StaticInfo *HESaveData_obj_sStaticStorageInfo = 0;
#endif

::hx::Class HESaveData_obj::__mClass;

static ::String HESaveData_obj_sStaticFields[] = {
	HX_("init",10,3b,bb,45),
	::String(null())
};

void HESaveData_obj::__register()
{
	HESaveData_obj _hx_dummy;
	HESaveData_obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("HESaveData",24,b0,d1,bf);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &HESaveData_obj::__GetStatic;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(HESaveData_obj_sStaticFields);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(0 /* sMemberFields */);
	__mClass->mCanCast = ::hx::TCanCast< HESaveData_obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = HESaveData_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = HESaveData_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}
