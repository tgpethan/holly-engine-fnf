// Generated by Haxe 4.1.5
#ifndef INCLUDED_lime_graphics_opengl_ext_OES_packed_depth_stencil
#define INCLUDED_lime_graphics_opengl_ext_OES_packed_depth_stencil

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_STACK_FRAME(_hx_pos_cffe52c47ffe91d7_4_new)
HX_DECLARE_CLASS4(lime,graphics,opengl,ext,OES_packed_depth_stencil)

namespace lime{
namespace graphics{
namespace opengl{
namespace ext{


class HXCPP_CLASS_ATTRIBUTES OES_packed_depth_stencil_obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef OES_packed_depth_stencil_obj OBJ_;
		OES_packed_depth_stencil_obj();

	public:
		enum { _hx_ClassId = 0x7cf07ddd };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=false,const char *inName="lime.graphics.opengl.ext.OES_packed_depth_stencil")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,false,"lime.graphics.opengl.ext.OES_packed_depth_stencil"); }

		inline static ::hx::ObjectPtr< OES_packed_depth_stencil_obj > __new() {
			::hx::ObjectPtr< OES_packed_depth_stencil_obj > __this = new OES_packed_depth_stencil_obj();
			__this->__construct();
			return __this;
		}

		inline static ::hx::ObjectPtr< OES_packed_depth_stencil_obj > __alloc(::hx::Ctx *_hx_ctx) {
			OES_packed_depth_stencil_obj *__this = (OES_packed_depth_stencil_obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(OES_packed_depth_stencil_obj), false, "lime.graphics.opengl.ext.OES_packed_depth_stencil"));
			*(void **)__this = OES_packed_depth_stencil_obj::_hx_vtable;
{
            	HX_STACKFRAME(&_hx_pos_cffe52c47ffe91d7_4_new)
HXLINE(   8)		( ( ::lime::graphics::opengl::ext::OES_packed_depth_stencil)(__this) )->DEPTH24_STENCIL8_OES = 35056;
HXLINE(   7)		( ( ::lime::graphics::opengl::ext::OES_packed_depth_stencil)(__this) )->UNSIGNED_INT_24_8_OES = 34042;
HXLINE(   6)		( ( ::lime::graphics::opengl::ext::OES_packed_depth_stencil)(__this) )->DEPTH_STENCIL_OES = 34041;
            	}
		
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~OES_packed_depth_stencil_obj();

		HX_DO_RTTI_ALL;
		::hx::Val __Field(const ::String &inString, ::hx::PropertyAccess inCallProp);
		::hx::Val __SetField(const ::String &inString,const ::hx::Val &inValue, ::hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("OES_packed_depth_stencil",7b,19,31,fc); }

		int DEPTH_STENCIL_OES;
		int UNSIGNED_INT_24_8_OES;
		int DEPTH24_STENCIL8_OES;
};

} // end namespace lime
} // end namespace graphics
} // end namespace opengl
} // end namespace ext

#endif /* INCLUDED_lime_graphics_opengl_ext_OES_packed_depth_stencil */ 
