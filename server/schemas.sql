PGDMP                          {            employee_management    15.2    15.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16398    employee_management    DATABASE     ?   CREATE DATABASE employee_management WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
 #   DROP DATABASE employee_management;
                postgres    false                        2615    16490    schema    SCHEMA        CREATE SCHEMA schema;
    DROP SCHEMA schema;
                postgres    false            ?            1259    16476    employee_info    TABLE     S  CREATE TABLE public.employee_info (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    phone_number character varying(20) NOT NULL,
    gender character varying(10) NOT NULL,
    joined_date character varying(30) NOT NULL
);
 !   DROP TABLE public.employee_info;
       public         heap    postgres    false            ?            1259    16475    employee_info_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.employee_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.employee_info_id_seq;
       public          postgres    false    221                       0    0    employee_info_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.employee_info_id_seq OWNED BY public.employee_info.id;
          public          postgres    false    220            ?            1259    16445    employee_user    TABLE     t  CREATE TABLE public.employee_user (
    userid bigint NOT NULL,
    first_name character varying(32) NOT NULL,
    last_name character varying(32) NOT NULL,
    phone_number character varying(32) NOT NULL,
    gender character varying(32) NOT NULL,
    email character varying(32) NOT NULL,
    password character varying(255) NOT NULL,
    role character varying(255)
);
 !   DROP TABLE public.employee_user;
       public         heap    postgres    false            ?            1259    16444    employee_user_userid_seq    SEQUENCE     ?   CREATE SEQUENCE public.employee_user_userid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.employee_user_userid_seq;
       public          postgres    false    216                       0    0    employee_user_userid_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.employee_user_userid_seq OWNED BY public.employee_user.userid;
          public          postgres    false    215            ?            1259    16455    tokens    TABLE     ?   CREATE TABLE public.tokens (
    id bigint NOT NULL,
    access_token character varying(500) NOT NULL,
    userid bigint NOT NULL
);
    DROP TABLE public.tokens;
       public         heap    postgres    false            ?            1259    16453    tokens_id_seq    SEQUENCE     v   CREATE SEQUENCE public.tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.tokens_id_seq;
       public          postgres    false    219                       0    0    tokens_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.tokens_id_seq OWNED BY public.tokens.id;
          public          postgres    false    217            ?            1259    16454    tokens_userid_seq    SEQUENCE     z   CREATE SEQUENCE public.tokens_userid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.tokens_userid_seq;
       public          postgres    false    219                       0    0    tokens_userid_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.tokens_userid_seq OWNED BY public.tokens.userid;
          public          postgres    false    218            t           2604    16479    employee_info id    DEFAULT     t   ALTER TABLE ONLY public.employee_info ALTER COLUMN id SET DEFAULT nextval('public.employee_info_id_seq'::regclass);
 ?   ALTER TABLE public.employee_info ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221            q           2604    16448    employee_user userid    DEFAULT     |   ALTER TABLE ONLY public.employee_user ALTER COLUMN userid SET DEFAULT nextval('public.employee_user_userid_seq'::regclass);
 C   ALTER TABLE public.employee_user ALTER COLUMN userid DROP DEFAULT;
       public          postgres    false    216    215    216            r           2604    16458 	   tokens id    DEFAULT     f   ALTER TABLE ONLY public.tokens ALTER COLUMN id SET DEFAULT nextval('public.tokens_id_seq'::regclass);
 8   ALTER TABLE public.tokens ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    217    219            s           2604    16459    tokens userid    DEFAULT     n   ALTER TABLE ONLY public.tokens ALTER COLUMN userid SET DEFAULT nextval('public.tokens_userid_seq'::regclass);
 <   ALTER TABLE public.tokens ALTER COLUMN userid DROP DEFAULT;
       public          postgres    false    219    218    219            |           2606    16483 %   employee_info employee_info_email_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.employee_info
    ADD CONSTRAINT employee_info_email_key UNIQUE (email);
 O   ALTER TABLE ONLY public.employee_info DROP CONSTRAINT employee_info_email_key;
       public            postgres    false    221            ~           2606    16481     employee_info employee_info_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.employee_info
    ADD CONSTRAINT employee_info_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.employee_info DROP CONSTRAINT employee_info_pkey;
       public            postgres    false    221            v           2606    16452 %   employee_user employee_user_email_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.employee_user
    ADD CONSTRAINT employee_user_email_key UNIQUE (email);
 O   ALTER TABLE ONLY public.employee_user DROP CONSTRAINT employee_user_email_key;
       public            postgres    false    216            x           2606    16450     employee_user employee_user_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.employee_user
    ADD CONSTRAINT employee_user_pkey PRIMARY KEY (userid);
 J   ALTER TABLE ONLY public.employee_user DROP CONSTRAINT employee_user_pkey;
       public            postgres    false    216            z           2606    16463    tokens tokens_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.tokens DROP CONSTRAINT tokens_pkey;
       public            postgres    false    219                       2606    16464    tokens tokens_userid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_userid_fkey FOREIGN KEY (userid) REFERENCES public.employee_user(userid);
 C   ALTER TABLE ONLY public.tokens DROP CONSTRAINT tokens_userid_fkey;
       public          postgres    false    219    3192    216           